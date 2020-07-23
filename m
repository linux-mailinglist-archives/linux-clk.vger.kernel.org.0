Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D769022B721
	for <lists+linux-clk@lfdr.de>; Thu, 23 Jul 2020 22:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgGWUFB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 23 Jul 2020 16:05:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgGWUFA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 23 Jul 2020 16:05:00 -0400
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 381B520714;
        Thu, 23 Jul 2020 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595534700;
        bh=Sn6HoDY8PicNwWAOK0JVC4PUBrZWa9HKEhiZGKOtMwY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tdpfEy9/TuIlS1miYHevyg9cFfjUVIr0SMqJq3V1o5s1ty72i5pH3W7BATMwjL2qR
         Ib52wGUhvGVSBQFyd2dBJOzs2aeT6bplY7LIfFOL7tiTfABk9SHywBqtfi0BlxwOPj
         XySoNw2DeQ1PxhTshuc5XVW3TUx/R8VxVQXiWNyE=
Received: by mail-oi1-f174.google.com with SMTP id k6so6088928oij.11;
        Thu, 23 Jul 2020 13:05:00 -0700 (PDT)
X-Gm-Message-State: AOAM5334jPcNVV4k0CzZEuB1YYAuP2lqAN9VQCKbJc80njn4b2CV+l/n
        65TyONzxVip/ujEurzsC5Y3XWidyjaRdCEF18g==
X-Google-Smtp-Source: ABdhPJwWExdLUboZbuKY45/47MrATnklTefnT1gGZt8ZndUCAi2L0lI0a9kQ51jX4lZbOJsqfWsizPieoSOvViwRY8M=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr5467888oif.106.1595534699564;
 Thu, 23 Jul 2020 13:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200626115433.125735-1-maxime@cerno.tech> <20200723154421.yzecsy5qctqbgbxc@gilmour.lan>
In-Reply-To: <20200723154421.yzecsy5qctqbgbxc@gilmour.lan>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 23 Jul 2020 14:04:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLJGdxh4Taf5bSdh2+QvjhHsBvygeAS8nUp+hGf2uqTOg@mail.gmail.com>
Message-ID: <CAL_JsqLJGdxh4Taf5bSdh2+QvjhHsBvygeAS8nUp+hGf2uqTOg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: bcm: Add a select to the RPI Firmware binding
To:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 23, 2020 at 9:44 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Stephen, Mike,
>
> On Fri, Jun 26, 2020 at 01:54:33PM +0200, Maxime Ripard wrote:
> > The RaspberryPi firmware binding uses two compatible, include simple-bus.
> > The select statement generated by default will thus select any node that
> > has simple-bus, not all of them being the raspberrypi firmware node.
> >
> > This results in warnings being wrongfully reported. Let's add a custom
> > select statement to fix that.
> >
> > Fixes: 5bc0b9be8544 ("dt-bindings: arm: bcm: Convert BCM2835 firmware binding to YAML")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> >
> > The original binding has been merged through the clock tree, so it should
> > be merged there.
>
> Could you apply that patch to clk-next?

While I said 'simple-mfd' would be more appropriate, that's a separate
issue I guess, so:

Acked-by: Rob Herring <robh@kernel.org>

BTW, qcom,msm8996-apcc.yaml is also breaking linux-next.
