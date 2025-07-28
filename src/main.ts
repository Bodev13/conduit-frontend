import { platformBrowserDynamic } from "@angular/platform-browser-dynamic";

import { AppModule } from "./app/app.module";

platformBrowserDynamic()
  .bootstrapModule(AppModule)
  .catch((err) => console.error(err));

import { environment } from "./environments/environment";

const hostname = window.location.hostname;
const apiPort = 8000;
environment.API_URL = `http://${hostname}:${apiPort}/api`;
