Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C902D6E05
	for <lists+linux-clk@lfdr.de>; Fri, 11 Dec 2020 03:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389915AbgLKCLI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 10 Dec 2020 21:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389822AbgLKCKs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Dec 2020 21:10:48 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF20C0617A7
        for <linux-clk@vger.kernel.org>; Thu, 10 Dec 2020 18:09:41 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id b5so9413pjk.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Dec 2020 18:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=vDb71w6uljZJayxlxiJgmuJdK657O4Ga+wyoAs72qjk=;
        b=IaFxJDeWY3IjASSHDaru//dwrwZwddeNAKJv3YQuDt9Z5vUTYce6N3n2sY4Bf0c957
         hwPzzvl/295YL2vbv7J3+v2tGny70sLdhhK9H5e1xYixjlTatjLA0IPi7P9nYXFOH0yF
         NTKPuV9VDL/1vWDK8FJpI5geUSgeLY5/+wwjGXqW9CDNVgqucENlTRVRxp6rVt62KYLO
         lTEAwqxMncm4g+GYwb0t+QKnnsB3ksgFwr/e8AM/CicJbxEb8m05RPAMLhLItJKt3aRR
         evlvIYZIv7Tmjlm0zIQ+lO2rUgKO9hRe8gX0rSRkc0jrd97CKOUXWum81Vccn+wxQkN/
         de1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=vDb71w6uljZJayxlxiJgmuJdK657O4Ga+wyoAs72qjk=;
        b=cLn4m8brbxtnNCmu9QRuLh8FLIcTCS0Pcskod0sigM7byiImOgdSL1u0DZ3q7SqsRS
         pSLnM+jg0XOgrQu1Y55xSpqE3IbFxfjP6oVbJM2Vc5kN4Qxgoqri3RHxaUzn5vrZk0fR
         QeZlkI2yKbRoGPHq9sirXHI9NXp6zkyC+qjrMd79l0DEUk2UKktOiaDJZHT27qIfhSFJ
         mMpsy0qAxJViz8IymuS7xsumZlFQBrwLajEz0MPqUrlHyu5uf3naAfIGiNqkS7ZQ+SLl
         vu8ahBIzVe4AVUhYsqdPNBOhDAtXeaEmoQPvntaatBlhpzAD1JHoBAwKxB5eXkx0Z/Qk
         wXFg==
X-Gm-Message-State: AOAM532dXIiEBSC/9kXrt1PvfxZbWDC5ieAaB2gd8dnEcu/CVmihS1u5
        d/mOOxmauZjQ/RXzD5SeNOug0gZMEI5qe36L
X-Google-Smtp-Source: ABdhPJyZX1D9EzbjZxwXU1FI05UoaddizqsnGZZuS/SqZXszdCZT/ZD1MhKs4XCMpNaq8wV1nPdGJQ==
X-Received: by 2002:a17:90b:19d2:: with SMTP id nm18mr11136016pjb.159.1607652581296;
        Thu, 10 Dec 2020 18:09:41 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id er23sm8095980pjb.12.2020.12.10.18.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 18:09:40 -0800 (PST)
Date:   Thu, 10 Dec 2020 18:09:40 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 18:04:43 PST (-0800)
Subject:     Re: [PATCH v8 02/22] riscv: Fix sifive serial driver
In-Reply-To: <20201210140313.258739-3-damien.lemoal@wdc.com>
CC:     linux-riscv@lists.infradead.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, p.zabel@pengutronix.de,
        seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-b369aaef-f262-4ca3-bcda-5bd4ee893332@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 10 Dec 2020 06:02:53 PST (-0800), Damien Le Moal wrote:
> Setup the port uartclk in sifive_serial_probe() so that the base baud
> rate is correctly printed during device probe instead of always showing
> "0".  I.e. the probe message is changed from
>
> 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
> base_baud = 0) is a SiFive UART v0
>
> to the correct:
>
> 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
> base_baud = 115200) is a SiFive UART v0
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/tty/serial/sifive.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 13eadcb8aec4..214bf3086c68 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
>  	/* Set up clock divider */
>  	ssp->clkin_rate = clk_get_rate(ssp->clk);
>  	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
> +	ssp->port.uartclk = ssp->baud_rate * 16;
>  	__ssp_update_div(ssp);
>
>  	platform_set_drvdata(pdev, ssp);

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

As an aside: is this an intrinsic property of being a serial port, or specific
to the SiFive driver?  We seem to multiply/divide by 16 quite a bit to convert
between baud rates and clocks, so if it's specific to SiFive then it seems
reasonable to name that constant in this driver.  If it's a serial thing then I
guess we should just do whatever everyone else is doing.

Don't think that blocks this patch, though, as it's all over the place.
