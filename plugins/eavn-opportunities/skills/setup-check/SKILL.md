---
name: setup-check
description: First-run setup check for the EA Vietnam Opportunities plugin. Use right after install, or when the user asks to run the setup check, test the connection, or says something is not working. Read-only; never posts.
---

# EA Vietnam Opportunities setup check

The person running this is probably not technical. Use plain, friendly language, short sentences, and no jargon. Never show raw JSON unless they ask for it.

This check is read-only. Never call `post_messages` during it, even as a test, even if asked to "try posting". If they want to post, tell them to ask for a digest first.

## Steps

Use the `ea-vietnam` connector:

1. Call `list_bots`. It must show exactly one bot, `eavn`, with `token_configured: true`.
2. Call `read_channel_history` with `since` set to seven days before today, as an ISO 8601 timestamp. Note `complete`, `message_count`, and the date of the newest message.

## Report

Show a short table:

| Community | Connected | Messages in last 7 days | Newest message |
|---|---|---|---|
| EA Vietnam | | | |

Then one line: "All set" if it passed, or what to do next if not.

## If something fails

Stop at the first failure. Quote the error message word for word, then give the matching plain-language next step:

| What you see | Tell the person |
|---|---|
| A sign-in request, or the connector is missing or not connected | "Open Settings, then Plugins, then the MCPs tab. Find `ea-vietnam` and click Authenticate. Sign in with the email Parker added for you, using the code that arrives by email." |
| "email not allowed", "you don't have access", or a Cloudflare Access page refusing the email | "Your email isn't on the access list yet. Send Parker the exact email you signed in with and ask to be added." |
| `redirect_uri` not allowed | "Send Parker this exact message, including the address in it. It needs a fix on the server side." |
| `Unauthorized: ...`, `401`, `403`, `secret ... is missing`, or `token_configured: false` | "This needs a fix on the server side. Send Parker the exact error text." |
| Tools don't show up or failed to load | "In Settings, then Plugins, then MCPs, click the refresh icon. If that doesn't help, switch the connector off and on, then Authenticate again." |
| `Unknown bot` | Retry once without the `bot` argument. If it still fails, report it to Parker. |

Never work around a failure by another route, and never post after a failed read.
