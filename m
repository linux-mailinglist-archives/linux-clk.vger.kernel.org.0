Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB2B22268D
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jul 2020 17:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgGPPKf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 16 Jul 2020 11:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgGPPKe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jul 2020 11:10:34 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC9DC08C5C0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2020 08:10:34 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k6so7460720wrn.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2020 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2m1M98EH1nfWkFNzV2VhpZKvvoVfQRllbm5fo3WQqlY=;
        b=LOendPNIH4Ofg8EGJ+B7ht+ifCEDSJEs0Y7UgjXJxJQUVInRrJUX57gDkVZxGHYjsZ
         huOkeoMfVADRZfQ+hxvRIZr+u5Kw73rUxW0y/W4OQO3t7mbSNpedFbhfSUi/CdqiP++F
         dZ8fMAHU7FhFKiF7paIyQ2XQR8qZlSeLOZeQLJCrzL6hVGpAq3BVRID66H3ssWcMrsNP
         ozgidJwcVDai/+ESiQysfhiLSY1ow3zSgzAp8e/bia4rwkV0FH8pPGVHwWFAYZrzFOak
         KfQ1/2F5dOZyvvoSt2ZCqsvWoyRER02JfoX87tgwcHKwMRAHLtZkyFcIzGaHF3A0DdNz
         VxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2m1M98EH1nfWkFNzV2VhpZKvvoVfQRllbm5fo3WQqlY=;
        b=A5NQWoX6jl2Z5p+10xY/mEY2hJzmeXE8qY1whCG+VvJcgsGSnCv4wPZbz2SM3fPThW
         Ayqp0CVZZlIVCsSG+ou3rlSr4VstkrgNEFslAsDo1EUu1ML8ZRuJIzHVOxgAoCe8+9cR
         6y9O+3Qky8t8AJHVvsLhZ+syu8JltoQRudqCzUWz0K3qdvy1vuF8Xo40sGjsrjvIixgv
         MOrz/eqhu0bht/T9woWn1qov3H60a7RKa6Yq9fixkHQloukUVPCw3JJAYqCo6+K6Rb9h
         0TErFnGB7stPS1IIt+QqSBkXuxKpB3KUgbFnutjhre09CzYKgUjilgBoEx+RkNVWDqg8
         upuQ==
X-Gm-Message-State: AOAM530fJv8zeHSzRpm3WzKVjHZG8nB/RNSDIe8I74eDOjlwytY0ndvX
        y+PjDBFrA1U00KLRGfy/T6DbTA==
X-Google-Smtp-Source: ABdhPJwBTtAOhrqKUUqfWPZvxA5XjDD38qzwHlXSFn/QJ+SGDyX9onIUUbkdHZL69xzg75el0nUvDw==
X-Received: by 2002:a5d:55ca:: with SMTP id i10mr5507967wrw.225.1594912233054;
        Thu, 16 Jul 2020 08:10:33 -0700 (PDT)
Received: from dell ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id w7sm8654363wmc.32.2020.07.16.08.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 08:10:32 -0700 (PDT)
Date:   Thu, 16 Jul 2020 16:10:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        p.zabel@pengutronix.de, clabbe@baylibre.com, icenowy@aosc.io,
        megous@megous.com, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com
Subject: Re: [PATCH v3 10/16] mfd: axp20x: Allow the AXP803 to be probed by
 I2C
Message-ID: <20200716151029.GA3165313@dell>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-11-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708071942.22595-11-frank@allwinnertech.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 08 Jul 2020, Frank Lee wrote:

> The AXP803 can be used both using the RSB proprietary bus, or a more
> traditional I2C bus.
> 
> Let's add that possibility.
> 
> Signed-off-by: Frank Lee <frank@allwinnertech.com>
> ---
>  drivers/mfd/axp20x-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
