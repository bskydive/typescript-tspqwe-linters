import { Observable, of } from 'rxjs';

class SomeComponent {
	someAsyncVar: Observable<any> = of();
	someVar = true;
	state: any;

	constructor() {}

	someAsyncFn():Observable<any> {
		let foo = this.getFoo();

		if (!foo) {
			foo = this.getFoo();
		}

		return of(this.someVar);
	}

	getFoo():boolean { return true; }

	foo():void {
		if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		}
	}
}
