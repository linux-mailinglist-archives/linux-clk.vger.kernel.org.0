Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 321FB7B0316
	for <lists+linux-clk@lfdr.de>; Wed, 27 Sep 2023 13:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjI0Ldf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 27 Sep 2023 07:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjI0Ld3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Sep 2023 07:33:29 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50602CFD
        for <linux-clk@vger.kernel.org>; Wed, 27 Sep 2023 04:33:25 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-533c92e65c9so9333544a12.3
        for <linux-clk@vger.kernel.org>; Wed, 27 Sep 2023 04:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695814404; x=1696419204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7oaQadNI9cp/jqhEK90+7phoQh1W7CA6pqxWC0Ghgw=;
        b=R0cKpQsdsMnXFEIgs+OqGSgZQ75bqHln1fjxgXl4VSNKJLbiOPkVzyd6pZlJ3iOSf9
         Q3JP1FqxAnhAQahYXwURmTBDnemakQ3lFYonXkCBZnZ1gSaDii9hioK3uVPtE3AqbkJh
         uYibpJ/pysDX7ciSBIwikNGxCugcKn5+eSPJ/M+gQBWBe5NS2Znb86DCyrOgUPtuIp+m
         wPvbCoakCJq2BK2ujgn4DT+2dZux3hDRTedXW4aWF4Pmm5SloShOBqCO29zJG115iKil
         9UJW2tM4nZR3D0o/kQoIamf6L9nwVgsO9uKt4jHUXOYXpiBDACC/XFBWlchLTHveM4jo
         i08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695814404; x=1696419204;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7oaQadNI9cp/jqhEK90+7phoQh1W7CA6pqxWC0Ghgw=;
        b=bvHRqXB8JzI9Ip64AF1dSlZeyWOfA3lVn56NsPVuwkMJBUijP9LbtFQLhAyEDwJhxf
         v3CMJWC4yNnrre907ClrA/dqpmpp87SWS7I1WeresF7O4/FaISNb/jErtJeIlP1+mpQ4
         QGU4pcDkBbz7Yl1basevCIaVUi4Yb0VN6SWFkxPVFfFppGDvI7pAhCqRyg3B2IKH71Sl
         UMTu8NJVMZ8hK/FQUDLVxP8u3wuyosP3cZEBXDlugMNvS2xJUbBS/qnAApTOKWhcRJyk
         rHfXJvwYbq+8c7aid1Q21m5thhkqsZq/sn5VpxYRrgbIScmtG75NQES5g/S8Qqg9D4yu
         ZgXA==
X-Gm-Message-State: AOJu0YzHIMdYZjf57YyLPnFiZBs+CIljeK8LXaRTrqTWFmTnMSmMXm7b
        pnQ+d5ORrftqeLuKSZTZbKaSUA==
X-Google-Smtp-Source: AGHT+IESeV7GYJbaeP75duSbLSLMHtniTRGQwnUy9hphkucTIUKTno5QvjQkRtsFU9UKKZ7Biv1bsA==
X-Received: by 2002:a05:6402:1d92:b0:533:8eda:b8e4 with SMTP id dk18-20020a0564021d9200b005338edab8e4mr1648272edb.6.1695814403816;
        Wed, 27 Sep 2023 04:33:23 -0700 (PDT)
Received: from [192.168.33.189] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id a2-20020aa7cf02000000b005232ea6a330sm8065681edy.2.2023.09.27.04.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 04:33:23 -0700 (PDT)
Message-ID: <731f4e05-6205-432b-8cd5-29d5e1c2222d@linaro.org>
Date:   Wed, 27 Sep 2023 13:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] arm64: dts: qcom: ipq8074: include the GPLL0 as
 clock provider for mailbox
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230913-gpll_cleanup-v2-0-c8ceb1a37680@quicinc.com>
 <20230913-gpll_cleanup-v2-8-c8ceb1a37680@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230913-gpll_cleanup-v2-8-c8ceb1a37680@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14.09.2023 08:59, Kathiravan Thirumoorthy wrote:
> While the kernel is booting up, APSS PLL will be running at 800MHz with
> GPLL0 as source. Once the cpufreq driver is available, APSS PLL will be
> configured to the rate based on the opp table and the source also will
> be changed to APSS_PLL_EARLY. So allow the mailbox to consume the GPLL0,
> with this inclusion, CPU Freq correctly reports that CPU is running at
> 800MHz rather than 24MHz.
> 
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
