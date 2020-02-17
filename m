Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22056160BE4
	for <lists+linux-clk@lfdr.de>; Mon, 17 Feb 2020 08:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgBQHtT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 17 Feb 2020 02:49:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50288 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgBQHtR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Feb 2020 02:49:17 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so16047696wmb.0
        for <linux-clk@vger.kernel.org>; Sun, 16 Feb 2020 23:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=lcsYrSRBQv0/tuOiLtIdcGzeEqOZwy/ucgpprLmBBKY=;
        b=jtItyBiUgRgk6BmdYboXya2a/o9c2S21KkV7KiQxBx+O6/WaPpvHVfErJdssFjbZ4i
         P30GjGDkteiyBRZp0k8BhIW+1GcTywIEbovUouGu/OgfmsDsIjMiWshH7A4OKSd28gaH
         p5SS5NkDBquZz6AKGgu5seByFxMBbzCNQHVBbI7NAocYAgt1VqeoXMVMcjdYd9C4ccU6
         LDQwxS+4Xepn/dGwZJkW2wyMnIxyfFq2eDYcMgs9DQ6Dt7px1HlhQqUTSIfbTL6kZZGl
         jVFgUT/VcLP8iDlE2qaccCbQRDlQ7ewgbyFDpZ9SdHnRiRZuTI/jZHIkheuqwFHAzb/k
         Riiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=lcsYrSRBQv0/tuOiLtIdcGzeEqOZwy/ucgpprLmBBKY=;
        b=sHmDMR4r+AROmAMQsNh7gDEPw8mDHlBPc3wR0wPkYNR8w5QbDQiCWftcLPn14Myffh
         zA/kdy8recBW5pGn+IuuguYETYtmao7hr1Y8aV11l8GuaA0exCk2HrV3nTMgYh/SupGM
         niNSuZwBoVOeQ1T4NoPwPebVYH8rK5q19p5PL+aRlL2roOOWXYrHnhT9ikQ9OAbL+Bh+
         VGE6l5VhBEPiRxdIslJjHNrZl4YgOR4pu9bImegZxKdzOSxMWdIVNkfrnqMdUivm/z+M
         s4d07O/U5yI8eUQeto8RpxTRp/MepD3FGNqZs3QQdzf907BqxgCKm3Z0Xv0YLj6u4MRA
         dyMg==
X-Gm-Message-State: APjAAAX0NnaAgANxb9llpqd3CR5nQeSV0dy0UA9eMzZksW7XIihSKnxC
        R9Qqf/UkUS+0frP3BAzX7z3n1Q==
X-Google-Smtp-Source: APXvYqyJtjN2qsgU+dia/mVioDpDwyoJ+ti/pQN/I0BI9y/1B7olbgnxkE2KdsFVusIV1tYvrwUnkA==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr20042142wme.94.1581925754379;
        Sun, 16 Feb 2020 23:49:14 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id u23sm19462367wmu.14.2020.02.16.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 23:49:13 -0800 (PST)
References: <20200216173446.1823-1-linux.amoon@gmail.com> <20200216173446.1823-3-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCHv1 2/3] arm64: dts: meson: Add missing regulator linked to VCCV5 regulator to VDDIO_C/TF_IO
In-reply-to: <20200216173446.1823-3-linux.amoon@gmail.com>
Date:   Mon, 17 Feb 2020 08:49:12 +0100
Message-ID: <1jo8txzm9z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Sun 16 Feb 2020 at 18:34, Anand Moon <linux.amoon@gmail.com> wrote:

> As per schematics add missing VCCV5 power supply to VDDIO_C/TF_IO
> regulator. Also add TF_3V3N_1V8_EN signal name to gpio pin.

Why ? I don't see the connection with the cover letter here ...

>
> Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 353db3b32cc4..23eddff85fe5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -66,11 +66,14 @@ tf_io: gpio-regulator-tf_io {
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <3300000>;
>  
> +		/* TF_3V3N_1V8_EN */
This is not terribly useful ... same for the previous patch

>  		gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
>  		gpios-states = <0>;
>  
>  		states = <3300000 0>,
>  			 <1800000 1>;
> +		/* U16 RT9179GB */
> +		vin-supply = <&vcc_5v>;
That is not parsed and not even part of the gpio regulator binding
documentation. It won't make any difference.

>  	};
>  
>  	flash_1v8: regulator-flash_1v8 {

