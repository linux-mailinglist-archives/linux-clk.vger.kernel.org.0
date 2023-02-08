Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B95068E97F
	for <lists+linux-clk@lfdr.de>; Wed,  8 Feb 2023 09:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjBHICi (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Feb 2023 03:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjBHICi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 03:02:38 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEF73B656
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 00:02:36 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id z13so5244509wmp.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 00:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4pVmXav81pfLtiXP44XbehuhQ9TZgefQnc5YIUQ+J6E=;
        b=c6t4uou8yx25E88Jrt3w04mCTLJGSqXyH8adQhprx2ssoyLli11Ja+BWpNHDy//Q5q
         hbDxV1Bi/slcnupy6yXHSibp1hVuYbVVj5Z0IBVI56EfxZr81asSMl+58HORhxv8Pck+
         2/2ymRN/Ry+kA1W0jUaHJux+XXWuCLX+v+S6i6aGGYUnKw0o/trbYEJ3FNepsr7USInu
         viRqR6n/dx1E+PYkJoFIHzlLGQnZ1NZ+b24XY+MnWL0nUr+95nhhIJTR1TfEhf8A/uyo
         c1SHa+1W6BQukp4A2R0R4ArcLIFajXNjhJljPZQVYj0bgmP+RibUWZPIhxOjqCHkmMfe
         Gz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pVmXav81pfLtiXP44XbehuhQ9TZgefQnc5YIUQ+J6E=;
        b=WufhOnNGiEPzMLZdtz3TjBqw5g5BaIXNO2HNVrXZ4JExeUBIg7NSacNp5cYmTlQ2Vi
         vp65UXXbVl8tcsF3xiRwkCyxG1aRNx0hO2M61QUqa1rEHLqSdjVLxWFVGeIY3iq665HO
         gz9bt1Aq0jbNasC4osj5Q2J42t9DPUuqCZNORq/jTvvUbXpF+rPNYEODLZEWc7eJBau0
         p9ErW75LIFqa0yeqMuCP0gF+LCOJ8XmvDEoABEqGvgPtDYTVPqeOBW9hrlvjJPTIZ/dE
         OsZwse1R9f7kg8j1pX8j097TovdN5igDnTR0QhlebSQvHv1zs88GdJumI/3XzmQnZ202
         UmtA==
X-Gm-Message-State: AO0yUKUrlEnPq694g8I8gJ/8dHonKomWthTrYIP+UasdT5EDwzT7xaSX
        Fsr7x5LIBGzxRJ1bZXaFYdWGVg==
X-Google-Smtp-Source: AK7set/SZ2FNcYFFs2R31aNIpbtF+Y0jd0Sie+f4EwomceFk3zaHZLdPh2kn/l70TGbCD4ctPqMkNw==
X-Received: by 2002:a05:600c:43c4:b0:3dc:5302:ad9 with SMTP id f4-20020a05600c43c400b003dc53020ad9mr7688573wmn.27.1675843355020;
        Wed, 08 Feb 2023 00:02:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o27-20020a05600c511b00b003e0238d9101sm1196294wms.31.2023.02.08.00.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:02:34 -0800 (PST)
Message-ID: <7a3c2cf9-728f-0287-a4ef-d9645c78dfec@linaro.org>
Date:   Wed, 8 Feb 2023 09:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 4/5] dt-bindings: mailbox: qcom: add compatible for the
 IPQ5332 SoC
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230208042850.1687-1-quic_kathirav@quicinc.com>
 <20230208042850.1687-5-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208042850.1687-5-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/02/2023 05:28, Kathiravan T wrote:
> Add the mailbox compatible for the IPQ5332 SoC.
> 
> Since the IPQ5332 mailbox is compatible with the IPQ6018, lets create the
> fallback to ipq6018 compatible, so that we don't bloat the of_device_id
> table in the driver.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

