Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A994260955F
	for <lists+linux-clk@lfdr.de>; Sun, 23 Oct 2022 20:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiJWSJK (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 23 Oct 2022 14:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiJWSJE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 14:09:04 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571AA72B4B
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 11:09:00 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id e20-20020a05600c449400b003cce0107a6fso976418wmo.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 11:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SqFi2wmLGXsQfu/MZ0ShWytXRLk9pwr7X9yOqzu3XMM=;
        b=xr1jMXVmN57HPedWjHBHw1rrR1I978R/fF6s6AJxl5r6la7lQvhSNZVE8+g2y0CLiO
         sDalDXJWkgYjhjEW/tk2thpgvWl6aN/4cUoHucR/vgyQGfBHk/P8fVym9OLTYL9CaDNc
         gW1/wghLPtZzxuOCGhEE5dyrYtYTJsZ7jphSDYrKqG+oJwnjxwiZMzhfPhUVrkSGT+zu
         5VweFASmBJDlLQN+flFQth9QRLtbPOQNBbETZ75/uwAkj0tW+hrOnW5GnQhWc/dIW6xR
         vnkUaLQLdc5GSXiDVFlRPo8TgQp1RGMp1/59R56exH01qg/nbJrdKRA5l0wPE4Qmy1c+
         JkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqFi2wmLGXsQfu/MZ0ShWytXRLk9pwr7X9yOqzu3XMM=;
        b=cbY0ctIq++GdUiEXsisbx6p/Q5BMFDyBdVCdC/VNoNObK/psqMGkP79O7Z5LMl0XkT
         ms66V/Z/bkp1xp0up3vyi5AfWEBjJJ0/nLUHKeTQaAjUwVFG0vFemLIG2IeTwNeN4+4O
         LBLIu+zW4H4l4aRz475JBp6bySrl/DUIIwiCJbTgDtiZJ8CZKPq8gT+AJ3djjr/PZ7im
         kNvPe/Vlu8J55CalxUSE8KWxJ2x9tqq5P6qnpDlueWn0kzLBbW7aTX4wK8YAkujKoyMB
         h5G/MViht5iZD9GraPwWh/E3XC2tJlKAico4TP0dGJBa1FBMN0UoHzkaWT/TCuexbsuL
         IEpQ==
X-Gm-Message-State: ACrzQf3NhF2wSjlri62KuhDKIJtNDP5d+WDhUDr4PvX7y8hECCXP/Hot
        7JX2Cv8Tek4O/x58d06iX9kG8Q==
X-Google-Smtp-Source: AMsMyM72SUpT+H3YAHck0Mm/xenvuseMLAPPp2oOExNAh4/7iab4VjcAEYTBVCFws4DOL079RWUZ7Q==
X-Received: by 2002:a05:600c:5104:b0:3c6:d8e0:bc2e with SMTP id o4-20020a05600c510400b003c6d8e0bc2emr19762303wms.156.1666548538775;
        Sun, 23 Oct 2022 11:08:58 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:14a0:fbb0:c618:c972? ([2a05:6e02:1041:c10:14a0:fbb0:c618:c972])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d554a000000b002364c77bcacsm8318216wrw.38.2022.10.23.11.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 11:08:58 -0700 (PDT)
Message-ID: <b085d1ee-2924-47f5-a952-27040ae3eb1c@linaro.org>
Date:   Sun, 23 Oct 2022 20:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-2-arnd@kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/10/2022 22:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
