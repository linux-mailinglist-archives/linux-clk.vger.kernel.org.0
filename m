Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2429B715C65
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 12:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjE3K7X (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 06:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbjE3K7V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 06:59:21 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AD6F7
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:59:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-514859f3ffbso5656407a12.1
        for <linux-clk@vger.kernel.org>; Tue, 30 May 2023 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685444355; x=1688036355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NDIDZxbWQkJcbzz3vFoX/Qt0mJ60+sZaiqSDRcyoH0=;
        b=FBhNfMM6lwhJ7ntdtfkotjaYkbI0LmxP3JPfO33rcj4Oq5bcxiBAVvonE36OP7qUii
         LFKBoqe/BRZu9GclAJGIN5CXSrdDu3SIsAg6V0QI/1AOuOZSZ8VuOtaGHNMB75czie0q
         1LEf6K6XKoT/RXKfWJ/+I18U37wP1a8XECN836/PFqEufydHv8/KQ4eN5AtdWrsOQOhd
         /KgKBXc9uyCyIIWLIGrTzkbHWAQD023wWy1Qpu5EdSD1TpLT79Jy21XzGbQJUt45oOkY
         7tcnwo4/XRTRr0EGDjlcxdfK4bqEm4UpPkadEYEpHtgktxBgdiAzAs3/yr9jlO+g8Bi2
         yIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444355; x=1688036355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2NDIDZxbWQkJcbzz3vFoX/Qt0mJ60+sZaiqSDRcyoH0=;
        b=JhspZPddmumSaHBCaxI2xzqTM3d8pro/fIrqemuaQHwynANVI+mQZtanyimP7Ysuiy
         so06eapiPbSrVIyYhCpuYvmLKGFem+z6hthoF6Tb1azsw+BCF8loeLCvg9I5aDq+w42q
         AesuPV6USg7RywNHcU7R6vI97nN5MtHvEs8mSCPFDNYxNGABz9HbP9Ci3RG+u4gjaPT8
         MHefYmStStrv++yWiNbmttysB13IVC9KwS3KhjUuvgl+i6x1KhEO+dNNw1mSy0xMCJxf
         mQY/jszdc8qeZqxTlXkLsEZ9kZmJpkWS9IaNx/6SKCKD1kXHzOROVn7qmtWkpvADeUfL
         EnwQ==
X-Gm-Message-State: AC+VfDw5/mx86mGhV9Qqpwth/iI+TK1p6tGUTPu2sbC0KeruR7znew05
        DUNJiAvzX9DVAzntrn4RwIRGeg==
X-Google-Smtp-Source: ACHHUZ7XDiyMHM/ljlm1jil/pLp207k1d07hZRDQjC+35Wmxk9nUoi5iFPO1FbIWy/qnycaAl2FUmA==
X-Received: by 2002:a17:907:9714:b0:974:1ced:6a58 with SMTP id jg20-20020a170907971400b009741ced6a58mr2069880ejc.15.1685444354924;
        Tue, 30 May 2023 03:59:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060e1200b0094f7744d135sm7188846eji.78.2023.05.30.03.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:59:14 -0700 (PDT)
Message-ID: <67e82719-942a-9274-ae58-5591f71c0c7a@linaro.org>
Date:   Tue, 30 May 2023 12:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 02/13] dt-bindings: mailbox: qcom: Add IPQ5018 APCS
 compatible
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jassisinghbrar@gmail.com,
        mathieu.poirier@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, quic_eberman@quicinc.com, quic_mojha@quicinc.com,
        kvalo@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com, quic_varada@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230521222852.5740-1-quic_mmanikan@quicinc.com>
 <20230521222852.5740-3-quic_mmanikan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230521222852.5740-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2023 00:28, Manikanta Mylavarapu wrote:
> Add compatible for the Qualcomm IPQ5018 APCS block.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

