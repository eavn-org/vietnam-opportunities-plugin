# Vietnam Opportunities plugin for ChatGPT

This plugin lets ChatGPT read the **EA Vietnam #opportunities** and **AI Safety Vietnam 🎯-opportunities** Discord channels and draft new opportunity digests. It never posts anything until you reply with exactly the word `post`.

Setup takes about 5 minutes. You don't need any technical knowledge or extra software.

## Before you start

You need:

1. **The ChatGPT desktop app** on your computer. Download it from [chatgpt.com/download](https://chatgpt.com/download) and sign in.
2. **Access approval from Parker.** Send Parker the email address you'll sign in with. Parker has to add it to the access list first. If you skip this, sign-in will say you don't have access.
3. **The plugin file, `vietnam-opportunities.zip`.** Parker may send it to you directly. Otherwise, download it here: [vietnam-opportunities.zip](https://github.com/eavn-org/vietnam-opportunities-plugin/raw/main/dist/vietnam-opportunities.zip)

   **Don't open or unzip it.** ChatGPT needs the `.zip` file exactly as it is. If your Downloads folder shows a folder called `vietnam-opportunities` instead of a `.zip` file, your browser unzipped it automatically (Safari does this). Download it again in Chrome, or ask Parker to send you the file.

## Install (4 steps)

### 1. Open the upload window

1. Open the ChatGPT desktop app.
2. Click **Plugins** in the left sidebar. The icon looks like an @ sign.
3. Click the **Add** button (top right), then **Upload plugin archive**.

### 2. Upload the file

1. Drag `vietnam-opportunities.zip` from your Downloads folder into the box that says **Drag and drop your plugin here**. Or click **click to upload** and choose the file.
2. Click **Add plugin**.

### 3. Sign in (twice, once per community)

ChatGPT will ask you to connect two services: **ea-vietnam** and **ai-safety-vietnam**. For each one:

1. A sign-in page opens in your web browser.
2. Enter your email (the one Parker approved).
3. Check your inbox for a one-time code, and type it in.
4. Go back to ChatGPT.

If ChatGPT doesn't ask you to sign in, open **Settings**, then **Plugins**, then the **MCPs** tab. Next to `ea-vietnam` and `ai-safety-vietnam`, click **Authenticate**.

### 4. Check it works

Start a new chat and type:

```
Run the first-run setup check.
```

ChatGPT will check both channels and show a small table. If it says **All set**, you're done. It doesn't post anything during this check.

## Everyday use

Type one of these in a new chat:

- `Draft this week's EA Vietnam opportunities digest.`
- `Draft this week's AI Safety Vietnam opportunities digest.`

ChatGPT shows you the full draft first. Then reply:

- `post` to publish it to Discord (only this exact word counts),
- `edit` plus what to change, or
- `skip` to cancel.

## If something goes wrong

| What you see | What to do |
|---|---|
| ChatGPT won't accept the file | Make sure it's the `.zip` file, not an unzipped folder. Download it again, or ask Parker to send it. |
| "You don't have access" or "email not allowed" on the sign-in page | Your email isn't approved yet. Send Parker the exact email you used. |
| ChatGPT asks you to sign in again later | That's normal. Sign in again with the same email. |
| "Tools failed to load" or nothing shows up | Open **Settings → Plugins → MCPs** and click the refresh icon. If that doesn't help, switch the connector off and on, then click **Authenticate**. |
| Anything mentioning `redirect_uri`, `Unauthorized`, `401`, `403` or "secret is missing" | Copy the whole message and send it to Parker. It needs a fix on the server side. |
| You can't find **Upload plugin archive** | ChatGPT may have moved it. Look under the **Add** button on the Plugins page, or send Parker a screenshot. |

## Updating

When Parker sends a new version, remove the old plugin first: open **Settings → Plugins**, open **Vietnam Opportunities**, click **Delete plugin**. Then repeat steps 1 to 4 with the new file.

## For maintainers

- Plugin source: `plugin/` (`plugin.json`, `mcp.json`, `skills/`, `assets/`).
- Build the archive with `./scripts/build.sh`. It writes `dist/vietnam-opportunities.zip` with `plugin.json` at the archive root. Commit the rebuilt zip so the download link stays current.
- For each release, bump `version` in `plugin/plugin.json`.
- Servers: `https://discord-opportunities-mcp.eavn.org/mcp` (`ea-vietnam`) and `https://discord-opportunities-mcp.antoan.ai/mcp` (`ai-safety-vietnam`). Both use OAuth with dynamic client registration through Cloudflare Access. To give someone access, add their email to the Access policy and the Worker's `ALLOWED_EMAILS` on **both** servers.
