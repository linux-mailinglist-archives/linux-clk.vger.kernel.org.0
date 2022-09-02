Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9AA5AB82A
	for <lists+linux-clk@lfdr.de>; Fri,  2 Sep 2022 20:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIBS3F (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 2 Sep 2022 14:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiIBS3E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 14:29:04 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AB6111AD7
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 11:29:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w5so3306098wrn.12
        for <linux-clk@vger.kernel.org>; Fri, 02 Sep 2022 11:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=samYhApSiue4F9SKFyP/nfGqognVFcP2K4kMA9ZsZNc=;
        b=cHtVgbwMav8eoXd8UPdlWXEdfUgp0HFb1onFgFRetBNBC3C9+Ayj8ySMHLRpC8mpoI
         uu1xjT+VxLlRd6TAlgKtfPzQIDsn9Bl/Fr3NohMdkBYzLfcePw8T4Y7ZqiJaid5sQv/V
         kmXNkqstxszBnhdseyBYT8XWxq/Iqx65BizI0xrklkzdcpiVK+UN/z3O3BrSG2tnn1VR
         xnmGCj/qnVuBa/mYUaArc7ecTaSm7m+Rxih5UIn8wPZYRF6KMiVOSxS8z/t5d4KK4KXG
         iqHdfjvtkM2i0ByTDq2Ym8nMNJIiR1aaopvaDVUITRteuK8yFb5/84aCPppJ56w+MJp3
         U5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=samYhApSiue4F9SKFyP/nfGqognVFcP2K4kMA9ZsZNc=;
        b=YxdOpUvAJP9b2RCotR0AUN4OrpiqpT7OB6qH1bC9nellqbS1VKPIuU1bb+6Pn/VmEZ
         u0yrnpGc1374JDdlX7ZBgp4nkq/V3H+vvMJdL5pcU27jJzPQNz2CZ9YKysuqmDBKIqat
         KjRruoBU5Ahpid+BIuV0PhxflkLHhOSkvAqg1gCS2CbPFTSx1dDig90EzIJwVCaBJ/dt
         GEgLW87JHvthFesVgIwWznmJj8oH3YBtCmQA7MhNiU/8oPmOXC4vnsddszDxQ4CnBA7E
         CnMkyFMXY3wLpgPRC35wIcJiuOi+joOp6P4FuWArmMxBKD8Be1euLOhXUaidryb2/4kr
         Y+Fw==
X-Gm-Message-State: ACgBeo0YlfoENaCZi2eb5f9MX5Sc1uucSQt06jZG3GVAWPuyddhniIF5
        8rGhiBoh5/Ml5HjtNfFYnQe4Hw==
X-Google-Smtp-Source: AA6agR7IA2A7tqMFoUgfORv4pB4nIvZ/RLZmG29cSAtFFoXwwnOsHOOgSNSCSkwoozNdNhUZcFtYpA==
X-Received: by 2002:a05:6000:184c:b0:223:2c8b:c43c with SMTP id c12-20020a056000184c00b002232c8bc43cmr19132392wri.16.1662143341417;
        Fri, 02 Sep 2022 11:29:01 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m7-20020a5d6a07000000b0022586045c89sm2115203wru.69.2022.09.02.11.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:29:00 -0700 (PDT)
Date:   Fri, 2 Sep 2022 21:28:57 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marcel Ziswiler <marcel@ziswiler.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/12] clk: imx8mm: don't use multiple blank lines
Message-ID: <YxJLafhnMVUygQTs@linaro.org>
References: <20220722215445.3548530-1-marcel@ziswiler.com>
 <20220722215445.3548530-13-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722215445.3548530-13-marcel@ziswiler.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-07-22 23:54:45, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Avoid the following checkpatch warning:
> 
> include/dt-bindings/clock/imx8mm-clock.h:284: check: Please don't use
>  multiple blank lines
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Applied this one, thanks!

> 
> ---
> 
> (no changes since v1)
> 
>  include/dt-bindings/clock/imx8mm-clock.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
> index 47c6f7f9582c..1f768b2eeb1a 100644
> --- a/include/dt-bindings/clock/imx8mm-clock.h
> +++ b/include/dt-bindings/clock/imx8mm-clock.h
> @@ -281,7 +281,6 @@
>  #define IMX8MM_CLK_CLKOUT2_DIV			256
>  #define IMX8MM_CLK_CLKOUT2			257
>  
> -
>  #define IMX8MM_CLK_END				258
>  
>  #endif
> -- 
> 2.35.1
> 
