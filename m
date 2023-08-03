Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291A576EDD2
	for <lists+linux-clk@lfdr.de>; Thu,  3 Aug 2023 17:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbjHCPRM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Aug 2023 11:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236976AbjHCPRL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2023 11:17:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A141713
        for <linux-clk@vger.kernel.org>; Thu,  3 Aug 2023 08:17:08 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe2503e3easo1839800e87.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Aug 2023 08:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691075826; x=1691680626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TramLbKI90yPWYAVx7wulDWXQ7m/k8XvtzY338rmDp8=;
        b=Qyyl59lOl2jB7Y3iHJGFCPEiaavBtVlAPUCEC8E1LwA4bgYeEJkfQyawjz02EtCksR
         1sbZOb3+3+SP5nCmAZk5ikoqZC9sZczHGjg4H5R4FcQUy+/Zv+m82HptI11M6W9vFOpy
         QX9ldeEFcZqkdCKc0iIuYqNJBRyFPgqP7SkGXCMGxV46Nax3c5Y7RbMF1EiIb/ReIck/
         7ib5PRUvJE21TzdbYY/IiAQkKVjfKdhsPpVucUlXzoFraWwX62XFl3pMgOA2v1vHGs36
         odQQmNC9B3BkudhI6Y1sE+w9R24RVwhkJ618dDdyPcyLF8EGcp1A02H7I6Y8mYJXjx+h
         jWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075826; x=1691680626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TramLbKI90yPWYAVx7wulDWXQ7m/k8XvtzY338rmDp8=;
        b=JpgNw5ROnqxGqHsfAhlpAtTutUgJ+x0LN/iDEV4qZxJAWoBE27euzxAzbV9RUSUXpP
         IaBy7rorSXhEBa71FNjBBNBZWV/zccnNtrN+ffm1sFqi2S+OBw4aqFq1pMGMLH3kXLJd
         GCHD076PN4SIHwfhS4SmwZQohLsCMchxr/NEs+C8R7fE3IVa0U7CCaiqicUVRWEJQuSW
         Qn2gBnuEx6h4j4KZYe1EvPx7HZ+NW9/AJvKeDn6taNbp8F1Yi60o0NXUSFnX27KSMXec
         KvHRMjkYahmQt63XKNyFBbhOQDoBzYjJYL0tC9sJYo4nQMWR7f9EBh7XjE8/b1oW4JJd
         e6/w==
X-Gm-Message-State: ABy/qLY/PwoTZX+WRLuhEqsqcEbAsv9ENGCHhCYR64ONIB8tZ/7snUjv
        5ZLhcpaDENSK5TD3w5zIODMY1g==
X-Google-Smtp-Source: APBJJlEBDu/5LdfPpr8nkqRHfmK4saE2beuXmAn53UeT+6XCtyNtJksY2JY0YlXuTZcAcDBIWKsuug==
X-Received: by 2002:a05:6512:104e:b0:4fe:79c:7269 with SMTP id c14-20020a056512104e00b004fe079c7269mr8339745lfb.67.1691075826434;
        Thu, 03 Aug 2023 08:17:06 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id z25-20020ac25df9000000b004fe37339f8esm7340lfq.149.2023.08.03.08.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 08:17:05 -0700 (PDT)
Message-ID: <b7f0be32-df13-3993-bcea-75ff99166c0e@linaro.org>
Date:   Thu, 3 Aug 2023 17:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/8] clk: qcom: gcc-qdu1000: Register
 gcc_gpll1_out_even clock
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20230803105741.2292309-1-quic_imrashai@quicinc.com>
 <20230803105741.2292309-5-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230803105741.2292309-5-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3.08.2023 12:57, Imran Shaik wrote:
> gcc_gpll1_out_even clock is referenced as a parent, but not registered
> with the clock framework. Hence add support to register the same.
> 
> Fixes: 1c9efb0bc040 ("clk: qcom: Add QDU1000 and QRU1000 GCC support")
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
