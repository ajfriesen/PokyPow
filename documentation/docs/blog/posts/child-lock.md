---
slug: pokypow-child-lock
date: 2025-06-08
description: "A demo how the PokyPow child lock will work for you PC"
draft: false
---

# PokyPow - Child Lock for Computer

Hey nerds 👋

At the Home Assistant Community Day in Cologne, I had pretty interesting conversations regarding PokyPow.

One of the attendees asked me:

What is the difference to PiKVM and alike?
First, the PokyPow integrates with Home Assistant easily, allowing you to not only power on and off your PC but also check if it is actually running.
Second, I will build a child lock in the upcoming version.

Then he got interested! His kid was only allowed to game from Friday to Sunday, for an hour a day. The PokyPow would be the perfect use case.

With this, he could prohibit turning on the PC from Monday to Thursday while also tracking gaming time. When gaming time is over or soon to be over, you can send a notification and or clean shutdown the PC. No discussion needed 😉.

## The Child Lock

I have made a new contract with a company to produce the next and hopefully last version of PokyPow. (Still have hope!)

My current version does not allow the child lock feature because of the electrical design. But instead of waiting, I got myself an ESP32-C3, wired a button and LED up, and want you to see what it will look like:

<iframe width="560" height="315" src="https://www.youtube.com/embed/yO1_dbKfplQ?si=FhbyfW-pgE4_n03z" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>