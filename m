Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABEA4718AB0
	for <lists+linux-clk@lfdr.de>; Wed, 31 May 2023 22:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjEaUBk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 May 2023 16:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjEaUBi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 May 2023 16:01:38 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F72128
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 13:01:35 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so229892a12.3
        for <linux-clk@vger.kernel.org>; Wed, 31 May 2023 13:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685563294; x=1688155294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3eDjHnNMpBAuyn9jnH2JCTHF3bUcGt++WX3Jdu1m5k=;
        b=kN9/nocBEZ85wU61yadCgB1E6us8CKIFiWknQm+/35514hsQ1LQga0Flo4hpJnqcRn
         ZY/g/i6qao3FMm37IB7vtPvhYIAbTg5+DB71j6I27n0Jn3qnDW6g6/N8t9RmC3DDjAKI
         vcOEB9mJT63945QNYACTKeKrJJfeFNNkACFYjla4e8ROs5yBuZxd2KB6kPx1zSTUjBIx
         OBKRfo68pu2o//vn5Nbaxa0ZxVfpMBT66bPnjom7YLiyDMu7+obPSrGF8DUKuNqkNsI2
         uPUYI/S40G+4IXXkbmXB8qe/LnKz1AIoYEPGaku1Pv0bQLt6WysSXRkBDBdMHa6D92jS
         UGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685563294; x=1688155294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3eDjHnNMpBAuyn9jnH2JCTHF3bUcGt++WX3Jdu1m5k=;
        b=NqcDLL2cTgj8YjC6w310vCMcvqFtKsV90+lGa/kD5Pt8AplGAfJXTlRk/c90ODBOk/
         k03ZMIh3MZ8E5YEmcq9iBjLsaeqGCclpngp8fwqbAp0fcn99NyvdMwrT8rXhopeSB8/3
         tFHwF3zlMNceNlrvoNRKzyBVMCbRbMDYzykfg7YfYabZwt3UxoXo1Qt+CLHc2P+dTqKr
         /xB/Upytc0Z0Y1O1+2IQLPsyMf2pTu6uRB2ujqDHZDpOg+KJg4d656T7Kwxx7TbWXo+v
         PlmODasmdNFO9Hks8jrD0Y14Zrud4FJQ7KQJYYTdJPLP30GBNXttUPgO+jLt6MLkxm4w
         bq6g==
X-Gm-Message-State: AC+VfDyGqXdGJswa97dXVczGgekoiHFPBkKPyDdirUbt8BdAIFFGa6hS
        0bvaFhs1Qv01L8gkXIxO7OMIqw==
X-Google-Smtp-Source: ACHHUZ6lkzEFf9ch6zTGk1L03429+02NXVO6AVejJ7ycuzZpiYE+ItfDxHm6LXPnqsoJmPUqqST27g==
X-Received: by 2002:a17:907:6d86:b0:94e:dd30:54b5 with SMTP id sb6-20020a1709076d8600b0094edd3054b5mr7096787ejc.6.1685563294437;
        Wed, 31 May 2023 13:01:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906078d00b00968a2286749sm9550858ejc.77.2023.05.31.13.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 13:01:34 -0700 (PDT)
Message-ID: <098883dd-f517-d541-de00-1a7fc0ada017@linaro.org>
Date:   Wed, 31 May 2023 22:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/6] clk: qcom: Add lpass clock controller driver for
 SC8280XP
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-4-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230525122930.17141-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/05/2023 14:29, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on SC8280XP based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig            |  8 ++++
>  drivers/clk/qcom/Makefile           |  1 +
>  drivers/clk/qcom/lpasscc-sc8280xp.c | 63 +++++++++++++++++++++++++++++
>  3 files changed, 72 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 85869e7a9f16..e25993abb519 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -523,6 +523,14 @@ config SC_LPASSCC_7280
>  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
>  	  controller to reset the LPASS subsystem.
>  
> +config SC_LPASSCC_8280XP
> +	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"

depends on ARM64 || COMPILE_TEST

Best regards,
Krzysztof

