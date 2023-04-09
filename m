Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEC46DC01E
	for <lists+linux-clk@lfdr.de>; Sun,  9 Apr 2023 15:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjDINpB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 9 Apr 2023 09:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjDINo7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:44:59 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A889A3A9C
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:44:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5048c69dd4dso548944a12.3
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681047892; x=1683639892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=929lK8VO6bxJRF9BB7+iqZUXPeNl84XwHZdASD9/Zdo=;
        b=rYxKvfTrEXb5OIqyGp9lTdB00YiRER+tpYnhAFQsRh+B7awVo2Oo+3rJne/F5P62G1
         mvp6fEZxUzMPO2rsCXLEja1+O42269dyAt2exOLAV8Vd6tCRR/0dK/1EtBRcQasOX3WN
         ZxX7/Wmbe2qHIPldHg7pXB5H8TELQIQGNi7R+WoaJqKc1+ul9VkoppcTJtW3jq/qbROa
         oTwpfdU8E0EOeDzwFM2jI6n+2ssnLhtLLNzm6GYtbG3ns33lWeoPMTElwUHJ93PYBbrE
         qj3Dn02q8GnZli1cle+0lfwY5noe/RkCOO4BrZ3/lGmhdQEI/oSpamGJSiGrLgj45+qD
         JB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681047892; x=1683639892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=929lK8VO6bxJRF9BB7+iqZUXPeNl84XwHZdASD9/Zdo=;
        b=nVWmyOdpAD8i+ZOPMJV+zmn0SpnoNTqsRNxwgJMF/W+ufaY3ZgkCd5/tsIcPIVORkE
         S0n7CGbdBrV99+JT4wcVEbzVc/imvKMS6sHLAuZREzQhYmFD86QGniJ1I0P3lT32w9LK
         Ebg8eoru8F29yfIQy6h8wzOQJrdspAtORWEYPQIQv5LtygsQeTKLnF/9a2rd49nfWI+U
         D1SEXk1EaHvCRxF5oJGK2ymn+ZdexhZwYz9/IkvdH6ZuLEWVktavLykuh2QwooshAkOS
         p+rqOQ7pVybNdgDoSIlDhiclfFTg/3cM7MUZsQKBihoFYuRNv23du/uKGd4TykwL+y/x
         6JdA==
X-Gm-Message-State: AAQBX9cvRU4B53+THLw4hiO7PVBcgqIiHahAysaFbKPKl9Ldk7yM5mKI
        3HU3qx/cAfDTMKekYecCa5mpOg==
X-Google-Smtp-Source: AKy350YcZwQIld2OZPKeYxCnySWYyl53q0DSZapxZVKetjrWq8kcxFbiXFfTQ59ktk9wP6EnfyXE9Q==
X-Received: by 2002:a50:ed8b:0:b0:4fc:b51f:ff50 with SMTP id h11-20020a50ed8b000000b004fcb51fff50mr6831694edr.30.1681047892174;
        Sun, 09 Apr 2023 06:44:52 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id a71-20020a509ecd000000b00501dd53dbfbsm3952172edf.75.2023.04.09.06.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:44:51 -0700 (PDT)
Date:   Sun, 9 Apr 2023 16:44:50 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 2/7] clk: imx: fracn-gppll: disable hardware select
 control
Message-ID: <ZDLBUsQ+YyWi98Hm@linaro.org>
References: <20230403095300.3386988-1-peng.fan@oss.nxp.com>
 <20230403095300.3386988-3-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403095300.3386988-3-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-03 17:52:55, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When programming PLL, should disable Hardware control select to make PLL
> controlled by register, not hardware inputs through OSCPLL.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index ec50c41e2a4c..f6674110a88e 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -15,6 +15,7 @@
>  #include "clk.h"
>  
>  #define PLL_CTRL		0x0
> +#define HW_CTRL_SEL		BIT(16)
>  #define CLKMUX_BYPASS		BIT(2)
>  #define CLKMUX_EN		BIT(1)
>  #define POWERUP_MASK		BIT(0)
> @@ -193,6 +194,11 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  
>  	rate = imx_get_pll_settings(pll, drate);
>  
> +	/* Hardware control select disable. PLL is control by register */
> +	tmp = readl_relaxed(pll->base + PLL_CTRL);
> +	tmp &= ~HW_CTRL_SEL;
> +	writel_relaxed(tmp, pll->base + PLL_CTRL);
> +
>  	/* Disable output */
>  	tmp = readl_relaxed(pll->base + PLL_CTRL);
>  	tmp &= ~CLKMUX_EN;
> -- 
> 2.37.1
> 
