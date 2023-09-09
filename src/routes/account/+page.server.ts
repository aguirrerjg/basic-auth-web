import type { PageServerLoad } from './$types';
import { error, redirect } from "@sveltejs/kit";

export const load: PageServerLoad = async (event) => {
    const session = await event.locals.getSession();
    if (!session) {
      throw redirect(302, "/login");
    }
};