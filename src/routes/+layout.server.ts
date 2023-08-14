
// src/routes/+layout.server.ts

import type { LayoutServerLoad } from "./$types";

export const load: LayoutServerLoad = async (event) => {
    console.log(event.locals.getSession());
	return {
		session: await event.locals.getSession()
	};
};