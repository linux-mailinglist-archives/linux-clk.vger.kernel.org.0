Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19FC8568C42
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 17:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbiGFPHS (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 11:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbiGFPHR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 11:07:17 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E7926546
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 08:07:15 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a11so18827381ljb.5
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zYC1cAZNMI4fPCA/JdppgAdHhnjAV/K9sV/UY3ZbdgY=;
        b=rrSK0lSH6xcD+cXYKAeq6nq5btWfRc6kxx24RmPQUa7FpIkWJv+OHbTarF1Mpw3M36
         k6np8o4mBd7/prlksYArETIApb7BXM/C3LZEWjwNt/+2kjIDjXiy+qT5J3YbN3iRKYP6
         2v0MdtGlLkzWnddB0t5B7luXBgPJvAXUZlZWt8iuDoRhtBndyDpFpG7gNVBuDSNd0ktS
         0+ohzgdG8BPVaEmPIYtXIejY7yEMovsaVH6F5bbtE7sDMCi9DrT5yW07qVqgzthOceou
         iWLnil+/OvO7JqswmXcPelCFnHufYfEq+EZaKKPtM4d7gZivUxLbNXcM3taX6vEk2oIx
         U55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zYC1cAZNMI4fPCA/JdppgAdHhnjAV/K9sV/UY3ZbdgY=;
        b=Ao6CiXkVhwTdJLQbPN3HA5igYWQMVQxSrfNA5MjeV4Kt3Vj3l9tQCBRGbwk8/2lrhl
         fDlpVplQARSw826u6nE8wkJZ+OTPIzBUNKkr7KLz49GjmV4V42dNvm4TjGE4w7mFYu0R
         Wl+1xWX59PScP6aEGNkAkiJ6MYmPUficegVZSb859Kv6WLGdrHKDJ0EYIDPRMzkcWAmO
         78E86L2Lm+7iStWhixa/DSlqpze586r4CAEdOzFDiSKezvQHXGwHJFmnE51nKp7PoDLP
         zAXGzoYySVIeP6bkJtv/6qOIJroxaW6N0MAvIGB1CXPw66Nsc+oSmIYfDMgBW4wkA97W
         CuTA==
X-Gm-Message-State: AJIora/o3Im40Ksgv8pjiMymZ/Ai5qfg3qmpwDnjSMV/Po6+KemV6YKM
        GVf3EwSCEdPJctXX+VMpxWlEJA==
X-Google-Smtp-Source: AGRyM1vZFVDEcDCV3p5oTwQ75dQ6gh8Jm4BQFnEddiEH4wedRKJRyG0O43CyonUbxZkQzd52uJNZ1Q==
X-Received: by 2002:a2e:87c7:0:b0:25a:9605:a2b8 with SMTP id v7-20020a2e87c7000000b0025a9605a2b8mr22670802ljj.148.1657120034049;
        Wed, 06 Jul 2022 08:07:14 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u16-20020ac258d0000000b0047f6f675ea1sm6317115lfo.161.2022.07.06.08.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:07:13 -0700 (PDT)
Message-ID: <bcb64218-2d2b-2f6b-dc79-303bac8c3bd3@linaro.org>
Date:   Wed, 6 Jul 2022 17:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] ARM: DTS: qcom: fix dtbs_check warning with new rpmcc
 clocks
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220705202837.667-1-ansuelsmth@gmail.com>
 <20220705202837.667-3-ansuelsmth@gmail.com>
 <18e40247-7151-b50a-97fe-00ee88f47d9b@linaro.org>
 <62c565dc.1c69fb81.a4566.e9b2@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62c565dc.1c69fb81.a4566.e9b2@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/07/2022 12:20, Christian Marangi wrote:
> On Wed, Jul 06, 2022 at 09:44:04AM +0200, Krzysztof Kozlowski wrote:
>> On 05/07/2022 22:28, Christian Marangi wrote:
>>> Fix dtbs_check warning for new rpmcc Documentation changes and add the
>>> required clocks.
>>
>> There is no warning in the kernel, right? So the commit is not correct.
>>
> 
> Oh ok, the warning is generated by the new Documentation.

Patches, especially DTS, might go via different trees, so the moment DTS
is applied there might be no such warning.

Best regards,
Krzysztof
