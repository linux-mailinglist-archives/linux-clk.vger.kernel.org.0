Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0AC5512B6
	for <lists+linux-clk@lfdr.de>; Mon, 20 Jun 2022 10:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbiFTI0e (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 20 Jun 2022 04:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237456AbiFTI0b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 04:26:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203ED1276C
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:26:28 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id gl15so19575900ejb.4
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DYYyM5jMBzjreF2OSFmEkD6QKzHvv6pVwOrtPLBwZpY=;
        b=vmfy+ZrmNbK0XE2EaZyojsO2+CUnBj0SXR2c8Vmmd8+LK4xYa7JJHU25upiQexeO3Q
         keU1Tm4zhG70ASx3s7k8IgAgT89E/ITflHHSYugIOQPG7itMkBe1yIy9T4WY7Xx7aRMX
         FiKoND3wpuIkHk8vNAPqdzheoqFNRh9qwV2BUuyKjmhKjPMHNQ2No4nmygjAQ1qWvv0H
         h/S1qhcDFECuNjpDRSiAvU+Gr/L396yqO16qZ0elFcnwS/bKlEd/Sxgl+lV7rQPwmIu0
         AGyQuT8KFK0+lDl7na7XnZo1J/i+mm3Yjf+DaBeSDoFqQZh5xeMSLjJEmURNGjPerrFk
         LCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DYYyM5jMBzjreF2OSFmEkD6QKzHvv6pVwOrtPLBwZpY=;
        b=F/S+dlAH2ZrR4q7YQ2GnSy+/VVpJvIMHLOjOpiSK4u7gJs5Q2G+YV8MdqYstH03yPV
         qJtS0+PUPxwlg3aRGRguDMjesO7AOeOY2EvDXQ/1c1gAPghXGKpVe09Admiu1iHBLIZD
         pCTX232RTbRWaeoO4bLA8U7V+PmMw7mcO5AFmX7iFCrCY16ZzEYJm5insBtkRbKRP8Lz
         8WZu1AJdYpWjlolrtZuMlMfK46UrVJdG1CD9dcl9HFRB4DQuNXy4x9Hxqn43g+ZoL4hA
         Ev2xLtZpt4wCLiyRL58K/HqC+Ptv4z1g6bJMdUcj00GS62sCAu/TgJ6C5ARESxBCNWIn
         KOVA==
X-Gm-Message-State: AJIora+k2pB/yloqj81B+dIQzf+0TVNsOl/Gjmml7zgImxbRUxu6RoS0
        nmRQbTJ5xGolwJtmzTm+C9W7qw==
X-Google-Smtp-Source: AGRyM1vjeieZNc+Q0qRsOCvm3+jeMlF7gjngYmSV9EYUjMQ9pSEL8NxVmqcS1y+HktEDq38LVJiO0g==
X-Received: by 2002:a17:907:7f8f:b0:711:623e:b344 with SMTP id qk15-20020a1709077f8f00b00711623eb344mr20237480ejc.230.1655713586624;
        Mon, 20 Jun 2022 01:26:26 -0700 (PDT)
Received: from [192.168.0.207] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a12-20020a50858c000000b0042617ba638esm9651123edh.24.2022.06.20.01.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:26:26 -0700 (PDT)
Message-ID: <bfff9a73-0758-e996-91bf-f9b83047f1a8@linaro.org>
Date:   Mon, 20 Jun 2022 10:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 17/18] arm64: dts: nuvoton: Add initial NPCM845 EVB
 device tree
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220619151225.209029-1-tmaimon77@gmail.com>
 <20220619151225.209029-18-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220619151225.209029-18-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/06/2022 17:12, Tomer Maimon wrote:
> Add initial Nuvoton NPCM845 evaluation board device tree.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm64/boot/dts/nuvoton/Makefile          |  2 ++
>  .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 30 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nuvoton/Makefile
>  create mode 100644 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
