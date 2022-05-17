Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAE96529BE4
	for <lists+linux-clk@lfdr.de>; Tue, 17 May 2022 10:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242570AbiEQIME (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 May 2022 04:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242557AbiEQIMC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 04:12:02 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CB73CA5E
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 01:12:00 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ch13so33055021ejb.12
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=wgki0G9Wv5/n5UTtWnBOnizEKI49Vz+o/9uXaANdQKM=;
        b=KH000ohs4fSRZFwYuUErgsFjS+0iNt/SolTKyFfq26a3M3FIDXGsqXxQEfc5l8K4mu
         3sWrag2zururob2VyYFZxro19RauMPzVqz4rLMmCA/XP1pPNk0b9bxkrk9obSUqCWZAw
         IpgWgDAPdSpYAiMun3VHd2A1jY8fF581XNbGbs0BFzR5W/muhOob3IM/cf5qt/l4HpKd
         /u4qbkk60mPFKIp6lUcL5PziR5DToDcieBM24iVWCKjYqQMF5Pcd7+bKCBBOVIWE9HNj
         LUHTOyd4M6BSh14CfxJMclr9f+7hRnFdPTkusygmS9+yp4rVJwSiE4DCt9PVeDNLJRnz
         eFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wgki0G9Wv5/n5UTtWnBOnizEKI49Vz+o/9uXaANdQKM=;
        b=VbEvg0eLVdp5gRmMbikyyd0zqW7cFJOzoFAuDqxUVDXlgRdXDi1lVATCyKNNmIIbF+
         Pv07lKlFNf/Xm8msXM8YZBAOzkL5gOmhouHBSpxBuvrz8LyEfhDieBDgi4N/Qv/LHd72
         1pli+tuy0kfNIb3jdOJpCUzeHwi6Y0UgUmrLFXjJOKydOT04G05pnSoOSf69fIWUu2vf
         +pPL1M/+e/F9rubLDVkTt1hheg4EcGYcmBivDZtsBwu7Iewh9V8Oq+VS728fEfretPOg
         J1+G+0tBL9DwGh9lhQbqT831x9vWTHykNuXlcUK+Oj9zyn4+rJj6Bu0s2BXt23c/mjI7
         7g/Q==
X-Gm-Message-State: AOAM530wUfncBp3tob46a3Ny52iCJnN08uiLPuCY9jNVQG0yqwe+5knT
        DdeY/PVvU3M44eQ08mSyX0mE8Q==
X-Google-Smtp-Source: ABdhPJyiJ3rLUoJTATJaGDEwhiHxCghwyEgdBWxx+/58U3F4TRYwNr4DHdavl9jouiCx3wsL9t04uA==
X-Received: by 2002:a17:907:2bde:b0:6f3:8e91:3a60 with SMTP id gv30-20020a1709072bde00b006f38e913a60mr18053727ejc.434.1652775119498;
        Tue, 17 May 2022 01:11:59 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f4-20020a056402194400b0042aa6a43ccdsm3830418edz.28.2022.05.17.01.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:11:59 -0700 (PDT)
Message-ID: <824e71c1-11e9-a5f6-1706-e3970e42ef90@linaro.org>
Date:   Tue, 17 May 2022 10:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 07/11] dt-bindings: clocks: qcom,gcc-ipq8074: support
 power domains
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tdas@codeaurora.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20220515210048.483898-1-robimarko@gmail.com>
 <20220515210048.483898-7-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220515210048.483898-7-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/05/2022 23:00, Robert Marko wrote:
> GCC inside of IPQ8074 also provides power management via built-in GDSCs.
> In order to do so, '#power-domain-cells' must be set to 1.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v4:
> * Alphabetically sort the cells properties


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
