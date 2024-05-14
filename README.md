## Deploying on Render

- Make sure your project is not inside another git repo.
- You should have a `.gitignore` file in your project root with the following in it.

```
.DS_Store
*.log
*.sqlite
node_modules
.swp
.env
tmp
```

- You should have a `.env` in your root with something similar to below content. (Make sure to change the database name)
- Windows users might have a different connection string with their username and password.

```
DATABASE_URL='postgresql://localhost:5432/goodfoodhunting'
SESSION_SECRET ='mistyrose'

```

### Environmental Variables

1. Ensure your database environmental variables have been set up.
2. Example below: Check if you have updated your port and secret key in server.js file.

```js
const port = process.env.PORT || 3000;

app.use(
  session({
    secret: process.env.SESSION_SECRET || "mistyrose",
    resave: false,
    saveUninitialized: true,
  })
);
```

3. To start your application in the production environment:

- open your `package.json` file.
- In the "scripts" section, add "start" key to include the command you want to use for starting your application. It should look something like this:

```json
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  }
```

### Creating a Web Service

1. Go to https://render.com/ and sign up.
2. Log in and click `New` > `Web Service`
3. In the `Create a new Web Service` page, connect your repository from the list of repositories if your Render account has been linked to your GitHub account.

   ![screen recs](gif/render-01.gif)

4. If your GitHub account was not linked, link the public Git repository URL in the `Public Git repository` section.
5. Add the `Name` for your app.
6. Select the appropriate `Region` according to your location.
7. `Runtime` - Select `Node`
8. `Build Command` - `npm install`
9. `Start Command` - `npm start`
10. Select the `Free` instance.
11. Create Web Service.

![screen recs](gif/render-02.gif)

### Creating a PostgreSQL Database on Render

1. In the navigation bar, click `New` > `PostgreSQL`.
2. Add the `Name` for your PostgreSQL database.
3. Select the appropriate region as per `step 6` for `Web Service`.
4. `PostgreSQL Version` - `15`
5. Select the `Free` instance.
6. Create Database.

   ![screen recs](gif/render-03.gif)

### Accessing your PostgreSQL database details

1. Go to your `Dashboard` and select your database.
2. Scroll down to `Connections`
3. `PSQL Command` is what you need to access the database through your CLI/Terminal.
4. Copy your `PSQL Command` and paste it in your CLI.
5. As your newly created database would be empty, you'll need to create the tables necessary as you did for your local PostgreSQL database.
6. Example:
   ```sql
   CREATE TABLE bread (
     id SERIAL PRIMARY KEY,
     name TEXT,
     image_url TEXT,
   );
   ```

### Connecting your PostgreSQL database to your Web Service app

1. In your PostgreSQL info page, copy the `Internal Database URL`
2. Go to your `Dashboard` and select your Web Service.
3. On the sidebar, click `Environment`.
4. Select `Add Environment Variable`.
5. Under `Key`, put `DATABASE_URL` and paste the `Internal Database URL` you copied from the database info as the `value`. Add `SESSION_SECRET` as the key and any value that you have provided for it in your app.

## Future deployments as you update your app:

#### Database

Run the psql connection string to connect to the production database like before and then run additional SQL lines.

#### Source code

Just push your code to Github and it will auto-deploy on Render.
If that doesn't work, you can select "manual deploy" on Render's dashboard.

## Troubleshooting

Click logs in your Render app's dashboard to see what errors have come up.