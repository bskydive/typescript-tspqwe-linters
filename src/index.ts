import * as someLint from 'stylelint';
import { Forms } from '@angular/core/unresolvedImport'
import * as someLintDup from 'stylelint';

export interface SomeInterfaceNeedsPrefix {
	name: string
	isMale: boolean
}

export const returnErrorInsteadPromise = async (): Promise<any> => {
	const SOME_VAR = 'some';
	const someVar2 = "some";

	try {
		console.log(someVar2);

		return await new XMLHttpRequest();
	} catch (error) {
		if (error && error.response) {
			throw new Error(error.response.data.message)
		} else {
			throw error
		}
	}
}
