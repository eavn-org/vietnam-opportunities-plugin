# Vietnam Opportunities plugin for ChatGPT

This plugin lets ChatGPT read the **EA Vietnam #opportunities** and **AI Safety Vietnam 🎯-opportunities** Discord channels and draft new opportunity digests. It never posts anything until you reply with exactly the word `post`.

Setup takes about 5 minutes. You don't need any technical knowledge.

## Before you start

You need:

1. **The ChatGPT desktop app** on a Mac or Windows computer. Download it from [chatgpt.com/download](https://chatgpt.com/download) and sign in.
2. **Access approval from Parker.** Send Parker the email address you'll sign in with. Parker has to add it to the access list first. If you skip this, sign-in will say you don't have access.

## Install (4 steps)

### 1. Add the plugin source

1. Open the ChatGPT desktop app.
2. Open **Settings**. On a Mac, click **ChatGPT** in the top menu bar, then **Settings…**
3. In the left sidebar, click **Plugins**.
4. Click the **Add** button (top right), then **Add a marketplace**.
5. Paste this link and confirm:

   ```
   https://github.com/eavn-org/vietnam-opportunities-plugin
   ```

### 2. Install the plugin

1. Click **Browse directory** (top right of the Plugins page).
2. Choose the **Vietnam Opportunities** source.
3. Open **Vietnam Opportunities** and click the **+** (install) button.

### 3. Sign in (twice, once per community)

ChatGPT will ask you to connect two services: **ea-vietnam** and **ai-safety-vietnam**. For each one:

1. A sign-in page opens in your web browser.
2. Enter your email (the one Parker approved).
3. Check your inbox for a one-time code, and type it in.
4. Go back to ChatGPT.

If ChatGPT doesn't ask you to sign in, go to **Settings → Plugins → MCPs**. Next to `ea-vietnam` and `ai-safety-vietnam`, click **Authenticate**.

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
| "You don't have access" or "email not allowed" on the sign-in page | Your email isn't approved yet. Send Parker the exact email you used. |
| ChatGPT asks you to sign in again later | That's normal. Sign in again with the same email. |
| "Tools failed to load" or nothing shows up | Go to **Settings → Plugins → MCPs** and click the refresh icon. If that doesn't help, switch the connector off and on, then click **Authenticate**. |
| Anything mentioning `redirect_uri`, `Unauthorized`, `401`, `403` or "secret is missing" | Copy the whole message and send it to Parker. It needs a fix on the server side. |
| You can't find **Add a marketplace** | ChatGPT may have moved it. Look under **Settings → Plugins**, or send Parker a screenshot. |

## For maintainers

- Marketplace catalog: `.agents/plugins/marketplace.json`
- Plugin: `plugins/vietnam-opportunities/` (`plugin.json`, `mcp.json`, `skills/`, `assets/`)
- Servers: `https://discord-opportunities-mcp.eavn.org/mcp` (`ea-vietnam`) and `https://discord-opportunities-mcp.antoan.ai/mcp` (`ai-safety-vietnam`). Both use OAuth with dynamic client registration through Cloudflare Access. To give someone access, add their email to the Access policy and the Worker's `ALLOWED_EMAILS` on **both** servers.
- To ship an update, edit the files, bump `version` in `plugin.json`, and push. Users get it when ChatGPT refreshes the marketplace.
