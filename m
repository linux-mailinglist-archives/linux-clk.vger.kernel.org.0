Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1B2776647
	for <lists+linux-clk@lfdr.de>; Wed,  9 Aug 2023 19:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbjHIRUt (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 9 Aug 2023 13:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbjHIRUs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Aug 2023 13:20:48 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75141FF7
        for <linux-clk@vger.kernel.org>; Wed,  9 Aug 2023 10:20:47 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so11466469e87.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Aug 2023 10:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691601646; x=1692206446;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NoJSetQ0sviUvyT9vTPr+TM2mfAvcrXiHSmgOnMYNnk=;
        b=cUWnuQPQHWRB9Gd6YmIvakjVi5WtBh4+tR9msvJS/bPkt1wxG2oxLMy18t9sRCltbf
         +N6pi0yiF2C0d1r1iCH0seNjXwX2BzefFF5g6kh9l05Z/2croBQbk8kg9ftFcojSxzT+
         PdYvKC+mOIUNSMJRUUUvw1uw40csmm6Ww57xGt935m1VmCUhI5q3xpDVhetwdewsKsHU
         o/UhgZHAkJWIMC6SKO3MK8s8qm8J/X6MAgtxDrVCr+5CQMEop0Z7RE6HOIiAR72xFO5F
         gXuNb3XLYFqqwWXoHDuGUJtwKbF+qKVoluR5fTygp7TE1NqsTSF0Jz31tZAF3wnHDF3j
         w1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691601646; x=1692206446;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoJSetQ0sviUvyT9vTPr+TM2mfAvcrXiHSmgOnMYNnk=;
        b=To7+ItN/Oeg+7lVysmoFT7wQ/kPsmi2k3gjabSov0/SQ+vtPJUTzPsv1Wz5to6aJ56
         soTiuL25MrnF9jeldz6ERJ1y4mCng36UHXq4lnU5R8MziayyzcBk/vQkXnH7jFUosdkv
         C3f2YrD4uPdiuACpFtm/Ms+OST1oRAVNzSXkO4jA5gW7qlcI7aVOGox26iDh8pe0IFQV
         2wYWE3R9WA4FQWTP2V/z6jQynfb3n2/VOBduzDdd6VwhP6xCWr+C/fMoGv70l7vj6ECc
         NwMJYr43//XUuvv5iyiCLlAG5naPJQxAN+q12paoL6IPx9Ee8P0pNAjvX1meGNBDhdsq
         LOdQ==
X-Gm-Message-State: AOJu0YxHqC8d+aD4iqUf9BNvpT9YLlExrXsQBKbxFZW9qBg8bFEg9TrA
        iuyHFdDeO4RsFddVpxynEyjAQA==
X-Google-Smtp-Source: AGHT+IEiNIBRZ8BJqEPKkd5kzOu/Dbi2M33GcJJM9FCr4XW2N9zj/HVqtE97g8v0VMMqX+4m34reZw==
X-Received: by 2002:a05:6512:1116:b0:4fe:1a99:45e3 with SMTP id l22-20020a056512111600b004fe1a9945e3mr2441213lfg.30.1691601645981;
        Wed, 09 Aug 2023 10:20:45 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id j5-20020ac25505000000b004fba5eb0a64sm2380095lfk.42.2023.08.09.10.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 10:20:45 -0700 (PDT)
Message-ID: <eada6628-c303-4161-8329-7a4a1d130e54@linaro.org>
Date:   Wed, 9 Aug 2023 19:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] clk: qcom: gpucc-sm6115: Add runtime PM
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
 <20230717-topic-branch_aon_cleanup-v1-7-27784d27a4f4@linaro.org>
 <ZLaSpFFBzP_Yz5yY@hovoldconsulting.com>
 <febaa3cd-f8c3-c35e-2f1d-403c80c132b8@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <febaa3cd-f8c3-c35e-2f1d-403c80c132b8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18.07.2023 15:28, Konrad Dybcio wrote:
> On 18.07.2023 15:24, Johan Hovold wrote:
>> On Mon, Jul 17, 2023 at 05:19:14PM +0200, Konrad Dybcio wrote:
>>> The GPU_CC block on SM6115 is powered by the VDD_CX rail. We need to
>>> ensure that it's enabled to prevent unwanted power collapse.
>>
>> This bit is not correct, the power domain would not have been disabled
>> until you enable runtime PM as part of this very patch.
> Right, this was a bit of a thought-jump. The part that ensures there's
> any vote at all is actually the DT commit adding a reference to the
> genpd.
Well I read it again and I think my original intention was "it = the power
domain" and not "it = runtime PM", it makes sense that way..

Anyway, I'll rephrase that to make it less ambiguous.

Konrad
