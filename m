Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A1C58A897
	for <lists+linux-clk@lfdr.de>; Fri,  5 Aug 2022 11:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237286AbiHEJQ4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Aug 2022 05:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbiHEJQz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 05:16:55 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801B612089
        for <linux-clk@vger.kernel.org>; Fri,  5 Aug 2022 02:16:53 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id w15so2441873ljw.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Aug 2022 02:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=NebOAZsDNUYEnk0zw74zqxdgooxqZ6OXU/cl7Qnopgo=;
        b=PwNdSdJ9vLfHwmC0vxJWGJatV/Psnd2QO3ZilR/uHik+SIXqZRdrG3ojXbOFCIhAKL
         g6Gq8ezk4foZnteWBwbEK4FFPv2qQPPJQliP0QJKmR+PazzsoPcZSmqFoE6tPpGiMO9J
         pBxQJhRyhWK9Ft4KaNykKPISKOLtxvqRqE70dDSyK8Y5es2Ecd+p3jjN/c/Fubqx31ri
         Z4Iy/PalR3/ESly9azFb202102tTADh9V4Ti0sZVR0Btg9v8POhWf5iqJL0gNt8vOSmG
         niRiCeHTB67wmLY/sU6V8nNo06AHisCyKwOeiIFMjAwCMBcedceIe+jg3siREVk43kfa
         /ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NebOAZsDNUYEnk0zw74zqxdgooxqZ6OXU/cl7Qnopgo=;
        b=Z+lXWYT3SBhdCacsWZGoKVXzeOM3PsEmQjHQAGMb6oajZW5+Zpfd3/mhv2DEMFjkDO
         fwciOSK9l11AuPA1BLoGNsIOy/5Vel03DKPI5NV66ZRHGuxus+exx8EHm8Sf1v8TT6YL
         seX+8Kjh+q4g7J1JX0rD5cYgMkJiUdFC7mmPqN4qyKiEy9cxVhGsJ8wSjcvlAegMzF+v
         CEX3ewLE796Bg9bzMrG6HGFnQ1M0lEAcRTyNJHG0PGPgMTBDonDrTrSctQhS3pGjcFYX
         oqdudOWYjfw6S/DwV5cAOicYxclMgKHCCUKyXLCil4lyaV3FczOKYBZSLF226pvu4qaQ
         4Flg==
X-Gm-Message-State: ACgBeo1/1VSvHjx7QZFG7jbl2uxERhLBAgLqTyTXrSYEM6yYO2CClj4e
        yM9Z2fAbYF3aUr8uQ7k1aPR8yw==
X-Google-Smtp-Source: AA6agR4yVEvRwgIhQrQa6MU6+RgXf6u+bO9zwQ0E+tfgpNd2ldoDmEgjNO26h8O36iiLY01NSXJOmQ==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr1905585ljh.78.1659691011885;
        Fri, 05 Aug 2022 02:16:51 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id c29-20020a05651200dd00b0048af749c060sm403940lfp.157.2022.08.05.02.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:16:41 -0700 (PDT)
Message-ID: <60f30470-ca14-1e12-3ed2-7b34c7a93f8a@linaro.org>
Date:   Fri, 5 Aug 2022 11:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 5/6] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-6-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-6-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2022 10:57, Yu Tu wrote:
> Added information about the S4 SOC Peripheral Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index a816b1f7694b..71be1dda15a2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
> +#include <dt-bindings/clock/amlogic,s4-clkc.h>
>  
>  / {
>  	cpus {
> @@ -100,6 +102,30 @@ clkc_pll: pll-clock-controller@8000 {
>  				#clock-cells = <1>;
>  			};
>  
> +			clkc_periphs: periphs-clock-controller {

Node names should be generic, so "clock-controller"
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

You miss here unit address. Test your DTS with dtbs check and with
regular compile with W=1.


Best regards,
Krzysztof
