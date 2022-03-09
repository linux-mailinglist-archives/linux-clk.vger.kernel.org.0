Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE644D24A9
	for <lists+linux-clk@lfdr.de>; Wed,  9 Mar 2022 00:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiCHXNF (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Mar 2022 18:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbiCHXND (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Mar 2022 18:13:03 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3EF7EA2C
        for <linux-clk@vger.kernel.org>; Tue,  8 Mar 2022 15:12:00 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id k25-20020a056830151900b005b25d8588dbso484907otp.4
        for <linux-clk@vger.kernel.org>; Tue, 08 Mar 2022 15:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NIeUfBbQiyEOaJvhbRmO4T1V+ggs7NcHxKpXGx3CcUg=;
        b=shaABnC1fz4XX6bf9zc6pc0ehX1xXu/6tiLr/y9kv8L9Ndwwm8LxlZzVLnVF+fKGpq
         Defj3bTg9qLEELpTMsADdsBEQnwBiakDiJQRbA9/435RDeKPcOhi3J0SZhiLWTu5tUs/
         7vn/KF2qEWk0wdUKHZ2UvfVO7hIzIafHHe2894rfEpjYMy7c4U5UdfDWa/7TazRAwhUl
         +ZKAZLhKXFH4EyNieGiCwaF8UBOmdLGpuiSk8MBsVdTqMgITUX38B1EJphDpuwnPsMTm
         /zd3ism7JgxVlb7b/SUHwdXqnxGbkT0vxywdlQr/wklTi9gjKOCs5HQW4/DYplgLpJoF
         HKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NIeUfBbQiyEOaJvhbRmO4T1V+ggs7NcHxKpXGx3CcUg=;
        b=HUMdlJPZgU00y/MzpWhfOqUB2aWBYE7misOEd054lAr6IMiTMvVrNrvSgt7HYwtEyP
         3QQeDSamPaJsaXHkgAT56KqUBbP2sr/GwRB8+sAXPkJotyMCQddMZLylYfiCoHe2O3Xa
         OEHqsiboA/t9f/gNyU3GBHZ5hd3qNv259wLJA9oiYwWJ4F97ZvPcquogchMENr7G7+5k
         vvh4+NEwXXu2qOVP1/8m6qhj4AYmvPh75BQ+EA+0OV9YxtupQ4RFdiHXtPjEh1yZMUW8
         asuD/lz/0xsaP6lPvaJomGzmSj25pl2yhHAWVQPyTUd3BcQNmEzaKMMtZUks4RHjpHk7
         IR5g==
X-Gm-Message-State: AOAM532tFGqHUEjHC+0Bowb27OQeP5KCGo04LfII9KZiQnn5o8dslieE
        MbV6UUOZOl7aaMlJzpiOVuQ2Gg==
X-Google-Smtp-Source: ABdhPJzRzJ+EfLNwSBtBRH4SshLivGux05CGMMfQj4fC2U66pqUfm6cTK4b6aH+2w5g9A1/Bh17tvg==
X-Received: by 2002:a9d:4604:0:b0:5b2:6100:7f11 with SMTP id y4-20020a9d4604000000b005b261007f11mr225949ote.300.1646781119901;
        Tue, 08 Mar 2022 15:11:59 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3-20020a056808114300b002d51f9b3263sm164287oiu.28.2022.03.08.15.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 15:11:59 -0800 (PST)
Date:   Tue, 8 Mar 2022 17:11:57 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: net: qcom,ethqos: Document SM8150
 SoC compatible
Message-ID: <YifivcMNJ7KIOn37@builder.lan>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
 <20220303084824.284946-2-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303084824.284946-2-bhupesh.sharma@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 03 Mar 02:48 CST 2022, Bhupesh Sharma wrote:

> From: Vinod Koul <vkoul@kernel.org>
> 
> SM8150 has a ethernet controller and needs a different configuration so
> add a new compatible for this
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

As you pass on Vinod's patch, you need to add your signed-off-by to
certify the origin of the patch.

Also please resubmit it (alone) to the networking list.

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.txt b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
> index fcf5035810b5..1f5746849a71 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.txt
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
> @@ -7,7 +7,9 @@ This device has following properties:
>  
>  Required properties:
>  
> -- compatible: Should be qcom,qcs404-ethqos"
> +- compatible: Should be one of:
> +		"qcom,qcs404-ethqos"
> +		"qcom,sm8150-ethqos"
>  
>  - reg: Address and length of the register set for the device
>  
> -- 
> 2.35.1
> 
