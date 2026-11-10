# Vietnam Opportunities plugins for ChatGPT

Two separate ChatGPT plugins, one per Discord community:

| Plugin | Discord channel | File to download |
|---|---|---|
| **EA Vietnam Opportunities** | EA Vietnam #opportunities | [eavn-opportunities.zip](https://github.com/eavn-org/vietnam-opportunities-plugin/raw/main/dist/eavn-opportunities.zip) |
| **AI Safety Vietnam Opportunities** | AI Safety Vietnam 🎯-opportunities | [aisvn-opportunities.zip](https://github.com/eavn-org/vietnam-opportunities-plugin/raw/main/dist/aisvn-opportunities.zip) |

Each plugin reads its channel and drafts new opportunity digests. It never posts anything until you reply with exactly the word `post`.

Install only the one you need, or both. Each takes about 5 minutes. You don't need any technical knowledge or extra software.

## Before you start

You need:

1. **The ChatGPT desktop app** on your computer. Download it from [chatgpt.com/download](https://chatgpt.com/download) and sign in.
2. **Access approval from Parker.** Send Parker the email address you'll sign in with, and say which plugin(s) you need. Parker has to add your email first. If you skip this, sign-in will say you don't have access.
3. **The plugin file.** Parker may send it to you directly. Otherwise, download it from the table above.

   **Don't open or unzip it.** ChatGPT needs the `.zip` file exactly as it is. If your Downloads folder shows a folder instead of a `.zip` file, your browser unzipped it automatically (Safari does this). Download it again in Chrome, or ask Parker to send you the file.

## Install (4 steps, once per plugin)

### 1. Open the upload window

1. Open the ChatGPT desktop app.
2. Click **Plugins** in the left sidebar. The icon looks like an @ sign.
3. Click the **Add** button (top right), then **Upload plugin archive**.

### 2. Upload the file

1. Drag the `.zip` file from your Downloads folder into the box that says **Drag and drop your plugin here**. Or click **click to upload** and choose the file.
2. Click **Add plugin**.

### 3. Sign in

ChatGPT will ask you to connect the plugin's service:

- **EA Vietnam Opportunities** connects `ea-vietnam`.
- **AI Safety Vietnam Opportunities** connects `ai-safety-vietnam`.

To sign in:

1. A sign-in page opens in your web browser.
2. Enter your email (the one Parker approved).
3. Check your inbox for a one-time code, and type it in.
4. Go back to ChatGPT.

If ChatGPT doesn't ask you to sign in, open **Settings**, then **Plugins**, then the **MCPs** tab. Next to `ea-vietnam` or `ai-safety-vietnam`, click **Authenticate**.

### 4. Check it works

Start a new chat and type:

```
Run the first-run setup check.
```

ChatGPT checks the channel and shows a small table. If it says **All set**, you're done. It doesn't post anything during this check.

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
| "You don't have access" or "email not allowed" on the sign-in page | Your email isn't approved for that plugin yet. Send Parker the exact email you used. |
| ChatGPT asks you to sign in again later | That's normal. Sign in again with the same email. |
| "Tools failed to load" or nothing shows up | Open **Settings → Plugins → MCPs** and click the refresh icon. If that doesn't help, switch the connector off and on, then click **Authenticate**. |
| Anything mentioning `redirect_uri`, `Unauthorized`, `401`, `403` or "secret is missing" | Copy the whole message and send it to Parker. It needs a fix on the server side. |
| You can't find **Upload plugin archive** | ChatGPT may have moved it. Look under the **Add** button on the Plugins page, or send Parker a screenshot. |

## Updating

When Parker sends a new version, remove the old one first: open **Settings → Plugins**, open the plugin, click **Delete plugin**. Then repeat steps 1 to 4 with the new file.

## For maintainers

- Plugin sources: `plugins/eavn-opportunities/` and `plugins/aisvn-opportunities/`. Each has `plugin.json`, `mcp.json`, `skills/` (a curator skill and a `setup-check` onboarding skill) and `assets/`.
- Build with `./scripts/build.sh`. It writes `dist/<plugin>.zip` with `plugin.json` at the archive root. Commit the rebuilt zips so the download links stay current.
- For each release, bump `version` in that plugin's `plugin.json`.
- Servers and access:

  | Plugin | Connector | Server |
  |---|---|---|
  | eavn-opportunities | `ea-vietnam` | `https://discord-opportunities-mcp.eavn.org/mcp` |
  | aisvn-opportunities | `ai-safety-vietnam` | `https://discord-opportunities-mcp.antoan.ai/mcp` |

  Both use OAuth with dynamic client registration through Cloudflare Access. To give someone access, add their email to that server's Access policy and to its Worker's `ALLOWED_EMAILS`.
