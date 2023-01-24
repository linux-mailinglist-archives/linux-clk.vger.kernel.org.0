Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F185679BEF
	for <lists+linux-clk@lfdr.de>; Tue, 24 Jan 2023 15:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbjAXOdA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Jan 2023 09:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbjAXOc4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2023 09:32:56 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCB63C03
        for <linux-clk@vger.kernel.org>; Tue, 24 Jan 2023 06:32:44 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id g10so11595744wmo.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Jan 2023 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDiS1iCUboVrRCsKlm7Fzmy1FXXwzKYsp25Aj0Yy6MQ=;
        b=vPtvZdOa87UVy/r+4SHu0OZoqhQC1mbPBb1lk1SIuBgnt2zuSIjtzfW4NGIBVD0H84
         6v8OACkHlDBy+yHF76OayE3+j6SqJAwx+1qYg3fVlGn5zZw1ANGhqs6J8n4Bs2maVU6a
         dihaM2KSVX0WTV5KVTEC0B6r/29kp/MISeR0nu9kJSL4oqKNr5oAVeZchM/7wiGLTcqX
         ZcgkldwnH3eNvfXnqndagRUz5izEsxyOZVEDiaHGAcCdSKXfOAdahbU9acfaitLVdEVB
         UcWJqZu3gIHfSC7nzXPs/kjTfySZtzfSIBJ3VL1mJHkDB4GHL70a7jdKxbNq0C5OtcnU
         ObJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XDiS1iCUboVrRCsKlm7Fzmy1FXXwzKYsp25Aj0Yy6MQ=;
        b=Zl1KtuGoDj7/HautQrRO/4kL9R4kQpIIUXqQS/83wpxckvWVMtk3SDDKsXQonVi/gG
         olleP1FXJPiqDUlS9PLbv1DZyyLplazTQ0fRtWZGf+CNanwozwqwK8YCmtWxMjUQHyOx
         NaWQbA53g/tJQTSAOFp1uy21JLKue/OJJJX8UMLCO1Xa4mqsShhLy7LIe3u4H9wZ5s9q
         s5xHp/25zhqQ8pSdjb1n+b/Enqql7o6DU5qNti5tilT7Zmj/wmMgNYbU/4LUu88af+sY
         24nHOLV8B+DpWMkri0A2F9W+JC9baUU3xYhXjBNnz10qFF0v5/A5JGDFb57KRxevqclZ
         BeMg==
X-Gm-Message-State: AFqh2kpBTPgzTwzUVR2xf2aMumm9YoMxshJGR6sUeX2acYJmmS8X3VOU
        FzrvbgewmFXIXnrP277LdmSkMA==
X-Google-Smtp-Source: AMrXdXsctwTFCtiWVY6Ey4pL/EArJw4xmGNT7B2kGRBsUfNDt8LEAZCPcupBoBqTG2mCKoR9qHLQAg==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id y9-20020a1c4b09000000b003db0f0a8726mr25144788wma.28.1674570762789;
        Tue, 24 Jan 2023 06:32:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003d9fba3c7a4sm13542158wmr.16.2023.01.24.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:32:42 -0800 (PST)
Message-ID: <5331527f-a96c-1c1b-dcf5-8f7e5957814d@linaro.org>
Date:   Tue, 24 Jan 2023 15:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V1 0/8] Add minimal boot support for IPQ9574
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230124141541.8290-1-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124141541.8290-1-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/01/2023 15:15, devi priya wrote:
> The IPQ9574 is Qualcomm's 802.11ax SoC for Routers,
> Gateways and Access Points.
> 
> This series adds minimal board boot support for ipq9574-al02-c7 board
> 
> [V1]

You already sent a v1. This should be v2.

> 	Fixed all the review comments

That's not specific enough.

Best regards,
Krzysztof

