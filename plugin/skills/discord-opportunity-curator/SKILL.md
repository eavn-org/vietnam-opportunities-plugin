---
name: discord-opportunity-curator
description: Curate and draft opportunity digests for the EA Vietnam or AI Safety Vietnam Discord community using their dedicated MCP connector.
---

# Vietnam Discord Opportunity Curator

Use only the dedicated opportunity connectors for Discord work. Never obtain or use a bot token, or call Discord by another route.

## Posting guardrail

Never post without explicit approval for the exact draft. Show the complete draft first, then call `post_messages` only after the user replies with exactly `post` for that draft. "Looks good," "ok," or silence are not approval.

Before posting, split at opportunity boundaries into one to ten messages, each no more than 2,000 characters; do not split an entry. Keep mentions disabled. After a successful post, share every returned message link.

If `post_messages` fails, do not retry. Report the error text and how many messages were sent before it, then wait for the user.

## Connector selection and setup check

- EA Vietnam content may use only the `ea-vietnam` connector. Its `list_bots` result must show only `eavn` with `token_configured: true`.
- AI Safety Vietnam content may use only the `ai-safety-vietnam` connector. Its `list_bots` result must show only `aisvn` with `token_configured: true`.
- If the user does not identify a community, ask which one.

At setup, call `list_bots` on both connectors. Then call `read_channel_history` on both with `since` set to seven days ago. For each channel, report its message count and the date of the latest bot digest. Do not post.

On any missing connector, sign-in request, or error from a connector, including `401`, `403`, `Unauthorized`, or `secret is missing`, stop. Quote the failure word for word, post nothing, and never post after a failed read.

## Digest workflow

When asked for a community's digest:

1. Call that connector's `read_channel_history` with no `since`. Proceed only if `complete` is `true`. Inspect every author's messages, URLs, embed titles, role titles, and organization names.
2. Build the already-posted set. Normalize a URL by lowercasing its host and removing protocol, `www.`, trailing slash, query string, and fragment.
3. Search authoritative listings for opportunities that are open now. Verify posted and deadline dates; discard expired items. Retain items based in Vietnam or Southeast Asia, or explicitly open remotely/internationally to applicants in Vietnam.
4. Apply the selected community's relevance bar below. Remove entries that match an already-posted normalized URL, or the same organization plus the same role after ignoring case, punctuation, seniority, and location suffixes. A role at a new URL is still a duplicate; a different role at the same organization is not. A new round of a recurring program is not a duplicate: name its round in the title. When uncertain, treat it as a duplicate.
5. Report counts for found, skipped as duplicates, and dropped by the bar. If no new opportunities remain, say so and stop.
6. Draft Discord markdown in the required format and ask the user to reply `post`, `edit` with feedback, or `skip`.

Do not invent a deadline or eligibility. Use "none listed" where needed. Prefer the official listing URL over an aggregator. Keep entries concise and skimmable.

## EA Vietnam bar and format

Include impact-focused EA jobs, internships, fellowships, courses, volunteer roles, grants, EA community-building roles, or EA cause-area opportunities in Vietnam or Southeast Asia. Search EA Opportunity Board/Forum, 80,000 Hours, Animal Advocacy Careers, Probably Good, Successif, Charity Entrepreneurship AIM, and EA-aligned careers pages such as GiveWell, Open Philanthropy, CEA, Rethink Priorities, GFI, and ACE.

Favor organizations an EA funder would plausibly fund over generic NGO or CSR roles. For animal advocacy, accept only effective work for farmed animals at scale: factory farming, cage-free or corporate-welfare campaigns, fish or shrimp welfare, or alternative proteins. Exclude companion-animal, wildlife, sanctuary, and rescue work. Prefer entry and mid-level roles, fellowships, courses, and grants; senior research jobs at US or UK organizations are usually too senior.

Start with an intro line bearing today's date. Under short cause-area headings when several entries exist, use a bold title and bullets for organization, location/remote eligibility, one-line description, known deadline, and listing URL.

## AI Safety Vietnam bar and format

Include AI-safety jobs, internships, fellowships, research programs, courses, hackathons, volunteer roles, and grants across technical safety (alignment, interpretability, evaluations, control, robustness) and AI governance/policy. Search 80,000 Hours AI-safety and policy filters, AISafety.com, MATS, BlueDot Impact, SPAR, ERA, LASR Labs, Apart Research, AI Safety Camp, Pivotal, GovAI, IAPS, CAIS, AI Safety Asia, government AI-safety institutes, Successif, EA Forum AI listings, and relevant funders.

The work must be substantively AI safety and plausibly fundable by an AI-safety funder. Exclude generic AI/ML engineering, capabilities roles including non-safety roles at frontier labs, AI product or startup jobs, and superficial responsible-AI CSR roles. The audience is students and early-career people in Vietnam: exclude senior US or UK roles unless explicitly open to early-career applicants.

Start with `🎯 AI Safety Opportunities, ` and a one-line intro. For each item, use a bold title followed by `[Technical]`, `[Governance]`, or both, then bullets for organization, location/remote eligibility, one-line description, deadline in bold if known, and listing URL. Do not use em dashes.
