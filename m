Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A703CA9F5
	for <lists+linux-clk@lfdr.de>; Thu,  3 Oct 2019 19:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388393AbfJCQRX (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Oct 2019 12:17:23 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44688 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389205AbfJCQRW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Oct 2019 12:17:22 -0400
Received: by mail-pl1-f195.google.com with SMTP id q15so1732352pll.11
        for <linux-clk@vger.kernel.org>; Thu, 03 Oct 2019 09:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=woKsN5Nvj3edIiL1mnog+HJwItqLGqoGggibhx+prXM=;
        b=HQAEmXF/vteXHA3wUvUvKzh5HoSg9S0QmvBoKuxVYXBOPyOwnLQNu0ojnI9ENc9Ztm
         oAl2oYSCkpNYvvNGLiZ2CYkYN5JmMbMcg+/63PFwNIF4bZyDwf6qxUrYGJNtUBybwSNp
         GW3/LiHFDHlufv8dYKPbMAMdI1yvxWVf3wRmh57d6KmDrIYklelTyqc/FXK8gWpNo48M
         LAeTZUhlIXsKmJvsB5HRZNWQlHNJhDRI6YWtz4h/sAsWEoxf+qlTTJju8gMlCGXsvaE2
         DMi6SjUq8ATeVYXTguDhgGT4uyKK5Zs4PaJxHJEEZjGGdfC31jAxrE7uSuyt41Ey7mJ5
         PR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=woKsN5Nvj3edIiL1mnog+HJwItqLGqoGggibhx+prXM=;
        b=sUv8fkLrp2KILaXn13AxzOTGZsZORuHUe9oeu4Zgxs6Xw99gYcFDHxb+5KPdWKzp0U
         Ixw9nrz+YHYX5OEkOsCNhb3axmXYZo+jenLlTF38Q6Kf5mPbxt+GbVboAwB8XEdE9tns
         1ntg/oqqJB6zn3i8E5BTb3ByWkSiJhfOQFi7wrrgr5+hvcZ4GUI8x7455cYIyFSkn18W
         3yw8iFKfikT2988/VicpZ7OmpeEl5B4DfhuBZHmSb+O/qolR/jkZriJ1Mzn/W8T+kYSz
         guZ0H8KURJcE4M7MazRdddlbuI1wsUR4Zucv6g2Zd7XiJA4gmE37zdGZzAYrVhOsV6to
         Sw8A==
X-Gm-Message-State: APjAAAUWaxtr9bwIqP/WJcVNJEIxZ8AMSNutrkqqNyDqxYA29pC6iJyS
        p1Hpe9xYDtcONvF6hMoGqMxOxNXijg==
X-Google-Smtp-Source: APXvYqwcF1Q6beDBQTdeoxkdICiYiMYrEpiV3RDw2oLfKtKRdUOjZccajdXgDjR+VWUVYjV6gLKSZQ==
X-Received: by 2002:a17:902:a986:: with SMTP id bh6mr10472391plb.197.1570119441739;
        Thu, 03 Oct 2019 09:17:21 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2405:204:71cf:7b8f:fca3:6f38:70fb:67fc])
        by smtp.gmail.com with ESMTPSA id f18sm3004698pgf.58.2019.10.03.09.17.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 09:17:20 -0700 (PDT)
Date:   Thu, 3 Oct 2019 21:47:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, thomas.liau@actions-semi.com,
        linux-actions@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 0/7] Add SD/MMC driver for Actions Semi S900 SoC
Message-ID: <20191003161714.GA14774@Mani-XPS-13-9360>
References: <20190916154546.24982-1-manivannan.sadhasivam@linaro.org>
 <CAPDyKFqsZ1mZ53b9wLruATzi+ymFrUCLhxzx7NFUq48p5w0Gtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqsZ1mZ53b9wLruATzi+ymFrUCLhxzx7NFUq48p5w0Gtw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ulf,

On Thu, Oct 03, 2019 at 12:01:18PM +0200, Ulf Hansson wrote:
> On Mon, 16 Sep 2019 at 17:46, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > Hello,
> >
> > This patchset adds SD/MMC driver for Actions Semi S900 SoC from Owl
> > family SoCs. There are 4 SD/MMC controller present in this SoC but
> > only 2 are enabled currently for Bubblegum96 board to access uSD and
> > onboard eMMC. SDIO support for this driver is not currently implemented.
> >
> > Note: Currently, driver uses 2 completion mechanisms for maintaining
> > the coherency between SDC and DMA interrupts and I know that it is not
> > efficient. Hence, I'd like to hear any suggestions for reimplementing
> > the logic if anyone has.
> >
> > With this driver, this patchset also fixes one clk driver issue and enables
> > the Actions Semi platform in ARM64 defconfig.
> >
> > Thanks,
> > Mani
> >
> > Changes in v4:
> >
> > * Incorporated review comments from Rob on dt binding
> >
> > Changes in v3:
> >
> > * Incorporated a review comment from Andreas on board dts patch
> > * Modified the MAINTAINERS entry for devicetree YAML binding
> >
> > Changes in v2:
> >
> > * Converted the devicetree bindings to YAML
> > * Misc changes to bubblegum devicetree as per the review from Andreas
> > * Dropped the read/write wrappers and renamed all functions to use owl-
> >   prefix as per the review from Ulf
> > * Renamed clk_val_best to owl_clk_val_best and added Reviewed-by tag
> >   from Stephen
> >
> > Manivannan Sadhasivam (7):
> >   clk: actions: Fix factor clk struct member access
> >   dt-bindings: mmc: Add Actions Semi SD/MMC/SDIO controller binding
> >   arm64: dts: actions: Add MMC controller support for S900
> >   arm64: dts: actions: Add uSD and eMMC support for Bubblegum96
> >   mmc: Add Actions Semi Owl SoCs SD/MMC driver
> >   MAINTAINERS: Add entry for Actions Semi SD/MMC driver and binding
> >   arm64: configs: Enable Actions Semi platform in defconfig
> >
> >  .../devicetree/bindings/mmc/owl-mmc.yaml      |  59 ++
> >  MAINTAINERS                                   |   2 +
> >  .../boot/dts/actions/s900-bubblegum-96.dts    |  62 ++
> >  arch/arm64/boot/dts/actions/s900.dtsi         |  45 ++
> >  arch/arm64/configs/defconfig                  |   1 +
> >  drivers/clk/actions/owl-factor.c              |   7 +-
> >  drivers/mmc/host/Kconfig                      |   8 +
> >  drivers/mmc/host/Makefile                     |   1 +
> >  drivers/mmc/host/owl-mmc.c                    | 696 ++++++++++++++++++
> >  9 files changed, 877 insertions(+), 4 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/owl-mmc.yaml
> >  create mode 100644 drivers/mmc/host/owl-mmc.c
> >
> > --
> > 2.17.1
> >
> 
> I have picked up the mmc patches for next

Thanks :)

> and as Stephen picked the
> clock patch, the rest are now for arm-soc, I guess!?
> 

Yes, I'll queue them through actions tree (unless Andreas wants to do the PR).

Regards,
Mani

> Kind regards
> Uffe
