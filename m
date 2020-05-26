Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4901C21C0
	for <lists+linux-clk@lfdr.de>; Sat,  2 May 2020 02:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgEBAB6 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 1 May 2020 20:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgEBAB5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 May 2020 20:01:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9664C061A0C
        for <linux-clk@vger.kernel.org>; Fri,  1 May 2020 17:01:56 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id o27so8416478wra.12
        for <linux-clk@vger.kernel.org>; Fri, 01 May 2020 17:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=mnpsimwuy1HsCYdnivLxUTPWGJ+CV1JI9EBiJoWcRMA=;
        b=TLRUgGZlzXDwbdGjCQKtFdsgwYIYywxs6IL2aaocBIxiHaukVw6K6LresyCp6t4BIr
         FTTqJD0TWaAqQ2cKqNfZCrGdiVU2fCHPQMSCdmbAEe0y4PHtHyhEWhvURKhanRCb1hVR
         kLuKs6W7wbYYvOLdaGsw24wZJs61iX329BFV267Vdr8wcbvzrQFRC/+J428L9qnwZi1T
         oPEz5vYKrQR6JTs4y3wBPMagXasiimuMJ6TsOukYAb75lv58yhPH5QSXAaxWsB3WmNrk
         vJjh89QVZWYh3QkCxQn2vVvnhG5PoD9c3EF/g4L8f4HsuNYe2dpvatNA2XZyCPqoUgTE
         2aoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=mnpsimwuy1HsCYdnivLxUTPWGJ+CV1JI9EBiJoWcRMA=;
        b=RcDeAz1yXRW1iOciWzl8VSFHdxRT8c2jBmzqQLR0bZef9JovsWiNzert1m/NMzrxmW
         WUy5g5jGB7Fei30li5pnitaYXWrIiGww4D2D6+O7Cm83n4lsFdTD1vb9UydkRKLZmTZN
         DqQhK3FGJngiYgaqAuVhSgIgaJjWw5k9qc7JlHKcI03K3rYF1gF5o8epCuT1vAHJ2EUc
         8y19uck8ldQusHchdeBptZM7hk3Zjyt15f7vg9Z3zRvBYwaULCb6jVOR54Yc7PQOZJLi
         E+26YjDDR7CAAZSlKaHntPN/xOVpapK7eDsXo661AgnPOxiBINAshpsbOY098mkJ7MQh
         KY8Q==
X-Gm-Message-State: AGi0PubABgJBALthkxU6TXjVHREQgeTFRVZwBRXhVMy1hRiBBTebLJ0l
        IUzXjTXALiWbfwGzDLuEJkrtQOturhp+pg==
X-Google-Smtp-Source: APiQypIC1GGFwHeCAXP+xnmsMVu4bX6+mXS0f6uQUk++cUTQ7edzDBG/oInezxMVoP8L2WvMnSlbPQ==
X-Received: by 2002:a5d:498b:: with SMTP id r11mr6556110wrq.368.1588377713218;
        Fri, 01 May 2020 17:01:53 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id s9sm7330900wrg.27.2020.05.01.17.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 17:01:52 -0700 (PDT)
References: <20200501215717.735393-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     narmstrong@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers
In-reply-to: <20200501215717.735393-1-martin.blumenstingl@googlemail.com>
Date:   Sat, 02 May 2020 02:01:50 +0200
Message-ID: <1jees3i4r5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 01 May 2020 at 23:57, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Not all u-boot versions initialize the HHI_GP_PLL_CNTL[2-5] registers.
> In that case all HHI_GPLL_PLL_CNTL[1-5] registers are 0x0 and when
> booting Linux the PLL fails to lock.
> The initialization sequence from u-boot is:
> - put the PLL into reset
> - write 0x59C88000 to HHI_GP_PLL_CNTL2
> - write 0xCA463823 to HHI_GP_PLL_CNTL3
> - write 0x0286A027 to HHI_GP_PLL_CNTL4
> - write 0x00003000 to HHI_GP_PLL_CNTL5
> - set M, N, OD and the enable bit
> - take the PLL out of reset
> - check if it has locked
> - disable the PLL
>
> In Linux we already initialize M, N, OD, the enable and the reset bits.
> Also the HHI_GP_PLL_CNTL[2-5] registers with these magic values (the
> exact meaning is unknown) so the PLL can lock when the vendor u-boot did
> not initialize these registers yet.
>
> Fixes: b882964b376f21 ("clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Jerome, this one is also not critical because we don't enable the VPU
> yet. So I based this on commit 16afd70af5b21b ("clk: meson: meson8b:
> Make the CCF use the glitch-free VPU mux").
>
>
>  drivers/clk/meson/meson8b.c | 9 +++++++++
>  drivers/clk/meson/meson8b.h | 4 ++++
>  2 files changed, 13 insertions(+)

Applied, Thx

>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 811af1c11456..edc09d050ecf 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1918,6 +1918,13 @@ static struct clk_regmap meson8b_mali = {
>  	},
>  };
>  
> +static const struct reg_sequence meson8m2_gp_pll_init_regs[] = {
> +	{ .reg = HHI_GP_PLL_CNTL2,	.def = 0x59c88000 },
> +	{ .reg = HHI_GP_PLL_CNTL3,	.def = 0xca463823 },
> +	{ .reg = HHI_GP_PLL_CNTL4,	.def = 0x0286a027 },
> +	{ .reg = HHI_GP_PLL_CNTL5,	.def = 0x00003000 },
> +};
> +
>  static const struct pll_params_table meson8m2_gp_pll_params_table[] = {
>  	PLL_PARAMS(182, 3),
>  	{ /* sentinel */ },
> @@ -1951,6 +1958,8 @@ static struct clk_regmap meson8m2_gp_pll_dco = {
>  			.width   = 1,
>  		},
>  		.table = meson8m2_gp_pll_params_table,
> +		.init_regs = meson8m2_gp_pll_init_regs,
> +		.init_count = ARRAY_SIZE(meson8m2_gp_pll_init_regs),
>  	},
>  	.hw.init = &(struct clk_init_data){
>  		.name = "gp_pll_dco",
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index 94ce3ef0c1d5..cd38ae2a9cb5 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -20,6 +20,10 @@
>   * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
>   */
>  #define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
> +#define HHI_GP_PLL_CNTL2		0x44  /* 0x11 offset in data sheet */
> +#define HHI_GP_PLL_CNTL3		0x48  /* 0x12 offset in data sheet */
> +#define HHI_GP_PLL_CNTL4		0x4C  /* 0x13 offset in data sheet */
> +#define HHI_GP_PLL_CNTL5		0x50  /* 0x14 offset in data sheet */
>  #define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
>  #define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
>  #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */

