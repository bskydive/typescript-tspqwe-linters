import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { ModalController, NavController, NavParams } from 'ionic-angular';
import * as _ from 'lodash';

// providers
import { AppProvider } from '../../../providers/app/app';
import { BwcErrorProvider } from '../../../providers/bwc-error/bwc-error';
import { ConfigProvider } from '../../../providers/config/config';
import { DerivationPathHelperProvider } from '../../../providers/derivation-path-helper/derivation-path-helper';
import { ErrorsProvider } from '../../../providers/errors/errors';
import { ExternalLinkProvider } from '../../../providers/external-link/external-link';
import { KeyProvider } from '../../../providers/key/key';
import { Logger } from '../../../providers/logger/logger';
import { LogsProvider } from '../../../providers/logs/logs';
import { OnGoingProcessProvider } from '../../../providers/on-going-process/on-going-process';
import { PlatformProvider } from '../../../providers/platform/platform';
import { PopupProvider } from '../../../providers/popup/popup';
import { ProfileProvider } from '../../../providers/profile/profile';
import { PushNotificationsProvider } from '../../../providers/push-notifications/push-notifications';
import {
  WalletOptions,
  WalletProvider
} from '../../../providers/wallet/wallet';

// pages
import { AddPage } from '../../add/add';
import { BackupKeyPage } from '../../backup/backup-key/backup-key';
import { KeyNamePage } from '../key-settings/key-name/key-name';
import { KeyOnboardingPage } from '../key-settings/key-onboarding/key-onboarding';
import { WalletSettingsPage } from '../wallet-settings/wallet-settings';
import { WalletExportPage } from '../wallet-settings/wallet-settings-advanced/wallet-export/wallet-export';
import { ClearEncryptPasswordPage } from './clear-encrypt-password/clear-encrypt-password';
import { ExtendedPrivateKeyPage } from './extended-private-key/extended-private-key';
import { KeyDeletePage } from './key-delete/key-delete';
import { KeyQrExportPage } from './key-qr-export/key-qr-export';

@Component({
  selector: 'page-key-settings',
  templateUrl: 'key-settings.html'
})
export class KeySettingsPage {
  public encryptEnabled: boolean;
  public touchIdEnabled: boolean;
  public touchIdPrevValue: boolean;
  public touchIdAvailable: boolean;
  public deleted: boolean = false;
  public noFromWalletGroup: boolean;
  public walletsGroup;
  public wallets;
  public canSign: boolean;
  public isDeletedSeed: boolean;
  public needsBackup: boolean;
  public showReorder: boolean;
  public derivationStrategy: string;

  private keyId: string;

  constructor(
    private profileProvider: ProfileProvider,
    private logger: Logger,
    private walletProvider: WalletProvider,
    private navCtrl: NavController,
    private navParams: NavParams,
    private externalLinkProvider: ExternalLinkProvider,
    private translate: TranslateService,
    private keyProvider: KeyProvider,
    private derivationPathHelperProvider: DerivationPathHelperProvider,
    private modalCtrl: ModalController,
    private errorsProvider: ErrorsProvider,
    private onGoingProcessProvider: OnGoingProcessProvider,
    private pushNotificationsProvider: PushNotificationsProvider,
    private bwcErrorProvider: BwcErrorProvider,
    private popupProvider: PopupProvider,
    private platformProvider: PlatformProvider,
    private logsProvider: LogsProvider,
    private appProvider: AppProvider,
    private configProvider: ConfigProvider
  ) {
    this.logger.info('Loaded:  KeySettingsPage');
    this.keyId = this.navParams.data.keyId;
    this.showReorder = false;
  }

  ionViewWillEnter() {
    this.walletsGroup = this.profileProvider.getWalletGroup(this.keyId);
    this.wallets = this.profileProvider.getWalletsFromGroup({
      keyId: this.keyId,
      showHidden: true
    });
    this.derivationStrategy = this.derivationPathHelperProvider.getDerivationStrategy(
      this.wallets[0].credentials.rootPath
    );
    this.canSign = this.walletsGroup.canSign;
    this.isDeletedSeed = this.walletsGroup.isDeletedSeed;
    this.needsBackup = this.walletsGroup.needsBackup;
    this.encryptEnabled = this.walletsGroup.isPrivKeyEncrypted;
  }

  public touchIdChange(): void {
    if (this.touchIdPrevValue == this.touchIdEnabled) return;
    const newStatus = this.touchIdEnabled;
    this.walletProvider
      .setTouchId(this.wallets, newStatus)
      .then(() => {
        this.touchIdPrevValue = this.touchIdEnabled;
        this.logger.debug('Touch Id status changed: ' + newStatus);
      })
      .catch(err => {
        this.logger.error('Error with fingerprint:', err);
        this.touchIdEnabled = this.touchIdPrevValue;
      });
  }

  public encryptChange(): void {
    const val = this.encryptEnabled;

    this.profileProvider.removeProfileLegacy();

    if (val && !this.walletsGroup.isPrivKeyEncrypted) {
      this.logger.debug('Encrypting private key for', this.walletsGroup.name);
      this.keyProvider
        .encrypt(this.keyId)
        .then(() => {
          const key = this.keyProvider.getKey(this.keyId);
          const replaceKey = true;
          this.keyProvider.addKey(key, replaceKey);
          this.profileProvider.walletsGroups[
            this.keyId
          ].isPrivKeyEncrypted = true;
          this.logger.debug('Key encrypted');
        })
        .catch(err => {
          this.encryptEnabled = false;
          const title = this.translate.instant('Could not encrypt wallet');
          this.showErrorInfoSheet(err, title);
        });
    } else if (!val && this.walletsGroup.isPrivKeyEncrypted) {
      this.keyProvider
        .decrypt(this.keyId)
        .then(() => {
          const key = this.keyProvider.getKey(this.keyId);
          const replaceKey = true;
          this.keyProvider.addKey(key, replaceKey);
          this.profileProvider.walletsGroups[
            this.keyId
          ].isPrivKeyEncrypted = false;
          this.logger.debug('Key decrypted');
        })
        .catch(err => {
          this.encryptEnabled = true;
          if (err === 'WRONG_PASSWORD') {
            this.errorsProvider.showWrongEncryptPasswordError();
          } else {
            const title = this.translate.instant('Could not decrypt wallet');
            this.showErrorInfoSheet(err, title);
          }
        });
    }
  }

  private showErrorInfoSheet(
    err: Error | string,
    infoSheetTitle: string
  ): void {
    if (!err) return;
    this.logger.warn('Could not encrypt/decrypt group wallets:', err);
    this.errorsProvider.showDefaultError(err, infoSheetTitle);
  }

  public openBackupSettings(): void {
    if (this.derivationStrategy == 'BIP45') {
      this.navCtrl.push(WalletExportPage, {
        walletId: this.wallets[0].credentials.walletId
      });
    } else {
      this.navCtrl.push(BackupKeyPage, {
        keyId: this.keyId
      });
    }
  }

  public openClearEncryptPasswordPage(): void {
    this.navCtrl.push(ClearEncryptPasswordPage, {
      keyId: this.keyId
    });
  }

  public openWalletGroupDelete(): void {
    this.navCtrl.push(KeyDeletePage, {
      keyId: this.keyId
    });
  }

  public openQrExport(): void {
    this.navCtrl.push(KeyQrExportPage, {
      keyId: this.keyId
    });
  }

  public openWalletGroupExtendedPrivateKey(): void {
    this.navCtrl.push(ExtendedPrivateKeyPage, {
      keyId: this.keyId
    });
  }

  public openSupportEncryptPassword(): void {
    const url =
      'https://support.bitpay.com/hc/en-us/articles/360000244506-What-Does-a-Spending-Password-Do-';
    const optIn = true;
    const title = null;
    const message = this.translate.instant('Read more in our support page');
    const okText = this.translate.instant('Open');
    const cancelText = this.translate.instant('Go Back');
    this.externalLinkProvider.open(
      url,
      optIn,
      title,
      message,
      okText,
      cancelText
    );
  }

  openWalletSettings(id) {
    if (this.showReorder) return;
    this.navCtrl.push(WalletSettingsPage, { walletId: id });
  }

  public reorder(): void {
    this.showReorder = !this.showReorder;
  }

  public async reorderAccounts(indexes) {
    const element = this.wallets[indexes.from];
    this.wallets.splice(indexes.from, 1);
    this.wallets.splice(indexes.to, 0, element);
    _.each(this.wallets, (wallet, index: number) => {
      this.profileProvider.setWalletOrder(wallet.id, index);
    });
    await new Promise(resolve => setTimeout(resolve, 1000));
    this.profileProvider.setOrderedWalletsByGroup();
  }

  public goToAddPage() {
    this.navCtrl.push(AddPage, { keyId: this.keyId });
  }

  public openWalletGroupName(): void {
    this.navCtrl.push(KeyNamePage, {
      keyId: this.keyId
    });
  }

  public showKeyOnboardingSlides() {
    const modal = this.modalCtrl.create(KeyOnboardingPage, null, {
      showBackdrop: true,
      enableBackdropDismiss: true
    });
    modal.present();
  }

  public syncWallets(): void {
    this.keyProvider
      .handleEncryptedWallet(this.keyId)
      .then((password: string) => {
        let keys;
        try {
          keys = this.keyProvider.get(this.keyId, password);
        } catch (err) {
          const title =
            'Your wallet is in a corrupt state. Please contact support and share the logs provided.';
          let message;
          try {
            message =
              err instanceof Error ? err.toString() : JSON.stringify(err);
          } catch (error) {
            message = 'Unknown error';
          }
          this.popupProvider.ionicAlert(title, message).then(() => {
            // Share logs
            const platform = this.platformProvider.isCordova
              ? this.platformProvider.isAndroid
                ? 'android'
                : 'ios'
              : 'desktop';
            this.logsProvider.get(this.appProvider.info.nameCase, platform);
          });
        }

        const opts: Partial<WalletOptions> = {};
        const defaults = this.configProvider.getDefaults();
        opts.bwsurl = defaults.bws.url;
        opts.mnemonic = keys.mnemonic;

        this._syncWallets(keys.mnemonic, opts);
      })
      .catch(err => {
        if (
          err &&
          err.message != 'FINGERPRINT_CANCELLED' &&
          err.message != 'PASSWORD_CANCELLED'
        ) {
          const title = this.translate.instant('Could not decrypt wallet');
          if (err.message == 'WRONG_PASSWORD') {
            this.errorsProvider.showWrongEncryptPasswordError();
          } else {
            this.showErrorInfoSheet(this.bwcErrorProvider.msg(err), title);
          }
        }
      });
  }

  private _syncWallets(words: string, opts): void {
    this.onGoingProcessProvider.set('syncWallets');
    this.profileProvider
      .syncWallets(words, opts)
      .then((wallets: any[]) => {
        this.onGoingProcessProvider.clear();
        this.finish(wallets);
      })
      .catch(err => {
        this.onGoingProcessProvider.clear();
        const title = this.translate.instant('Error');
        this.showErrorInfoSheet(title, this.bwcErrorProvider.msg(err));
      });
  }

  private async finish(wallets: any[]) {
    wallets.forEach(wallet => {
      this.walletProvider.updateRemotePreferences(wallet);
      this.pushNotificationsProvider.updateSubscription(wallet);
      this.profileProvider.setWalletBackup(wallet.credentials.walletId);
    });
    if (wallets && wallets[0]) {
      this.profileProvider.setBackupGroupFlag(wallets[0].credentials.keyId);
      await new Promise(resolve => setTimeout(resolve, 1000));
      this.profileProvider.setNewWalletGroupOrder(wallets[0].credentials.keyId);
    }
    this.wallets = this.profileProvider.getWalletsFromGroup({
      keyId: this.keyId,
      showHidden: true
    });
  }
}