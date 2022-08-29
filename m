Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6A3B5A4669
	for <lists+linux-clk@lfdr.de>; Mon, 29 Aug 2022 11:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiH2JsU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Aug 2022 05:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiH2JsU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 05:48:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE585E57C
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:48:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id c7so2777202wrp.11
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc;
        bh=yviMMnGD2NIBrfVD3zjnDAjWREiyBqmeaA8vluhbBlM=;
        b=MYtv7NXErfomVhACj4CvcivN5wiwJFqlN/QkD3Svj6b+WfT5ZQsEZdIQtNq5LdrJFa
         RMPVkYu7i4Ao/HAeEVdQI/hPwa0SOR7tS0YwhsxrvZMUfdd5jz1tEnycF0VAGFJgXxZt
         4r2zyWzIvXrnVb4vivTUZvwWkFML9pIjnCB3FoRM9Y8V3Q4X+hXchhnV8fEF+FRyh9kg
         4sfg6zLbTCqB391xVq4TU4s50ywE5qP/MQb03XMu2ewstmrrh316bKCwTNEJCmLNEYnk
         T0pV9Gz12E8gxs2Whz60vjZwFASEgdbJ+FM+vYHtNiJgXjTwNesDLcFAzehwL4QQyY1v
         sAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc;
        bh=yviMMnGD2NIBrfVD3zjnDAjWREiyBqmeaA8vluhbBlM=;
        b=78fEVqQSSJKf+OWITV2goB0muYN+xz+GbbdNXc2BWEG+ROvnoVczTHyL3JuoNYuFPb
         at6VeMxQ4+y1mGhNVl2OgCzuAu2M+2CZoxEwItTlIQUZ53n4oUFy00/run1g8hdUDIMB
         8a3/u4Hi/RdAfKtxXoaLv98O9RKRatIKG8yZmZBeZ+kW7molgBNWUYU0zr1ku72RknJ5
         vgdFc6wIfPCqafwWcNE3rVYGuDv5TGncX3RKWS81zOGlxxtmQ/i5V5yqui/0ihJHkqGY
         CUJ9EGqHMkZvO7kKEHegMN44lQkMQbUcofPUxi2MZaAbevOLUaOmza0L1EIRe4w4VS5j
         yhTA==
X-Gm-Message-State: ACgBeo2HyNIktKFXH3IOf2j8R0Bt1tQkMRYY54AypG4ZSWzfRi07Cybv
        949xpRRDYaWzuYDVrTRMd/NRrQ==
X-Google-Smtp-Source: AA6agR5lYEMVig3bo2NMgSo95EVg/KNxIK82zRJNlw7Kiy2jmOtoTniZzwOoPGDhG5XQe7+GIZSwaA==
X-Received: by 2002:adf:ea91:0:b0:226:dce6:c344 with SMTP id s17-20020adfea91000000b00226dce6c344mr1354957wrm.3.1661766492719;
        Mon, 29 Aug 2022 02:48:12 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bd22-20020a05600c1f1600b003a8436e2a94sm4385979wmb.16.2022.08.29.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:48:12 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date:   Mon, 29 Aug 2022 11:46:20 +0200
In-reply-to: <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
Message-ID: <1jwnartm78.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Mon 15 Aug 2022 at 14:34, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Jerome,
>
> On 2022/8/10 21:47, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 05 Aug 2022 at 16:57, Yu Tu <yu.tu@amlogic.com> wrote:
>> */

[... ]

>>> +#define ANACTRL_FIXPLL_CTRL0                       (0x0010 << 2)
>> I already commented on the "<< 2" . Remove them please.
> Sorry, maybe I didn't pay attention to this comment earlier. A little bit
> of a question why is this not okay? I understand isn't it better for the
> compiler to help with this calculation itself?

Because it is aweful to read

Also please trim your replies.
It is a bit annoying to search for your comments in the replies



