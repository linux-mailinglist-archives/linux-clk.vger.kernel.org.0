Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4507B663267
	for <lists+linux-clk@lfdr.de>; Mon,  9 Jan 2023 22:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237684AbjAIVML (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Jan 2023 16:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237845AbjAIVLl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 16:11:41 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9EFD6359
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 13:06:16 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id bq39so15081494lfb.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 13:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ATq9lfwFr3RZyhEmOv68Lea4iswGw4nEYd9xucpaSYI=;
        b=ZnHdLMPbbgf9UrAg9c/LZOWyW3VZt31oKL8x4C6RX9hvUmc4knhTljAbwJiRv/46jh
         udIB4KWy1VZo7xUMsjusVkPPts5uuRggRun1Qp7LPTkaJ9JXUr/Pimi7Hqp97vBJgTOA
         yH+HCn9sSJ3IZwpUjLOlXdm/zkU4vG6Y7+WpaMcSVHu4v6HMlkbxX8Jl8mb+oCWUa1WI
         VPP8CPXaOUWe9zU7vZ5abd1NYUIzuw+Q67fJbLk4UbBkqgq4K6QdIASOk9RXxRjbJKh4
         cZvcm26xYwAhfEczyf84Muh2jfibMQgKFN40g4Jrm+2Lg73Hg3a1YFbP5kaEZlu2E7Dg
         LYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATq9lfwFr3RZyhEmOv68Lea4iswGw4nEYd9xucpaSYI=;
        b=f1SdOxekAPZXacf8CQPobS7cSxYevTKoXlErHtdR8uhHTmzdwX9ZtIQSTa8PaBCYKN
         3Cr/1GCgluW09304kGeX/gyoMVbSnX1MUtuBlmPq2hCGEldsJ1ox66anyWeNrIh22KM/
         P8KlRGuVQl64xuwb6WJdj3Lw+2u/WR9flIhVYoejEpOXW1V2COA4bccbfN4XURZ4esOp
         VmH/MMqKWUsbQGSWbRaf/uTSFZS1KrBwydGNVUeC+J5NJ3VlCHjsSok91f8ztdKfWY0o
         KujU7oAjpm+nwtCmb87adxV9fJ2INZcGS9AjMm9fhVsOOuD5fsmeLWJqVQEmGFiqO5yg
         nz/A==
X-Gm-Message-State: AFqh2kqohlyN8MJeydtgJqGxGAvHGoNdOsF7icEzmbYPKIqYJjNoOC1P
        cqOs9rqfTjkC7OzX+Ns0+K88Wg==
X-Google-Smtp-Source: AMrXdXtMlPauAhWufnKfAA9Z0/kuM8Pxw6F0q+IwmA1VbDLnvpRiG1kH2m6PlPKVn/aIBM8cKwFg9Q==
X-Received: by 2002:ac2:5191:0:b0:4cb:20b3:e7f6 with SMTP id u17-20020ac25191000000b004cb20b3e7f6mr10698809lfi.19.1673298375321;
        Mon, 09 Jan 2023 13:06:15 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004cb3d77a936sm1780286lfr.46.2023.01.09.13.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 13:06:14 -0800 (PST)
Message-ID: <843eed4b-552a-a529-83ed-b813c1346c5f@linaro.org>
Date:   Mon, 9 Jan 2023 23:06:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/18] clk: qcom: add the GCC driver for sa8775p
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, Shazad Hussain <quic_shazhuss@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-3-brgl@bgdev.pl>
 <bbd21894-234e-542e-80ec-8f2bb11e268e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bbd21894-234e-542e-80ec-8f2bb11e268e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/01/2023 19:58, Konrad Dybcio wrote:
> 
> 
> On 9.01.2023 18:44, Bartosz Golaszewski wrote:
>> From: Shazad Hussain <quic_shazhuss@quicinc.com>
>>
>> Add support for the Global Clock Controller found in the QTI SA8775P
>> platforms.
>>
>> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>
>> [Bartosz: made the driver ready for upstream]
>> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
> [...]
>

As the driver didn't get to the list, I'll comment OOB.

Please use clk_regmap_phy_mux_ops where applicable (PCIe PIPE clocks).

-- 
With best wishes
Dmitry

