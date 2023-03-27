Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A216CA0CF
	for <lists+linux-clk@lfdr.de>; Mon, 27 Mar 2023 12:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbjC0KHB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 27 Mar 2023 06:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjC0KHB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Mar 2023 06:07:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10C749E9
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 03:06:59 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id h9so8353379ljq.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Mar 2023 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911618;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFv/A1+uJn3CnMRGy/hasrUt1t16K7NodNwg6vSfcFk=;
        b=IdP5kqn82eh9bgkRp3Z2liP32XsdMsNhWaiV1xVFrkUnDDdOgJNqCKvX6cMc2pDu93
         8gg4nWR/Ttc0Jqyd7iyE8dKcXkHmJ//8kQ8H+j+/uumRJqeZWv8JyaNdX3M9uQFRho67
         CBQ78CZa5lIvoKLWTVM04LWj+WeE1MWEyYu2sgb7BBynDbRvPhx7bimOWJpHDd95kZ5f
         EQeCKKyfafSHXq21IZ8d88qrCrirv8e0RZzDTo9iEoN5UlWxCp7RvL6ivDdyy8ccr9Ni
         efODoystPOCp1d9pAyHkyVcVaxJm3eu94F6I3oimPlUcABp00yBeRTX55r7GsyYmMj/z
         oW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911618;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFv/A1+uJn3CnMRGy/hasrUt1t16K7NodNwg6vSfcFk=;
        b=N7c4q19sSxStnWVx1ZJwxRUAgiXNxj2bp+G4+miHlk/r0gc0D8LT7+i4tM4EJ/e0Dg
         kTCqsnkTCT4cWRibzBYzyC+vUl4RmZY2kbztZqtlFdsH4ai6VIsrq/3vtvOkeuBuoiX8
         Lt6BRh+JllwvrO/HnW/SiIUihLERdnqAYTlch1WsC5tP4ueGcTaVen7tuG9M/2/IXTMN
         Mba7V3Rkg9FLCDpZ6bXGGqVSNY97pSMMpNZ0YmFH7HfdDr1T9+zrzjlqqV1dfUOeRvGY
         kp+0KgOH8Y4I9scyJx+Z1xpIOTaStV2sNtrb/hRUHQJ0Lbu437xv2psiYTWlSrUE15hb
         LQ+A==
X-Gm-Message-State: AAQBX9fHQ97QOyXzXbGtv/Hg3qNJ7YyTg04qj11s4C+lzQK34/5+2SX/
        jzXo1P8J5RoNBI2z11uR1lSMNw==
X-Google-Smtp-Source: AKy350ZoyXzkePDlK0a2Zv/qtfAPQqmBLJtchcelEf+6jFDMmAb+gyVqvE+cz+ETMv+aPdHloSJs2Q==
X-Received: by 2002:a2e:9c01:0:b0:29b:964e:693d with SMTP id s1-20020a2e9c01000000b0029b964e693dmr3635550lji.42.1679911618103;
        Mon, 27 Mar 2023 03:06:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j12-20020a2e6e0c000000b002a5faadb938sm156521ljc.138.2023.03.27.03.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:06:57 -0700 (PDT)
Message-ID: <522e9f28-bcb7-13cf-8da9-8db8a66193cc@linaro.org>
Date:   Mon, 27 Mar 2023 13:06:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 4/8] clk: qcom: gcc-ipq9574: Add USB related clocks
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679909245.git.quic_varada@quicinc.com>
 <ff189b0316ad524a7d8331bd89452112b60cdbb2.1679909245.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ff189b0316ad524a7d8331bd89452112b60cdbb2.1679909245.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/03/2023 12:30, Varadarajan Narayanan wrote:
> Add the clocks needed for enabling USB in IPQ9574
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>   Changes in v2:
> 	- Fixed coding style issues
> ---
>   drivers/clk/qcom/gcc-ipq9574.c               | 37 ++++++++++++++++++++++++++++
>   include/dt-bindings/clock/qcom,ipq9574-gcc.h |  2 ++
>   2 files changed, 39 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

