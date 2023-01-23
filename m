Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93E84677B57
	for <lists+linux-clk@lfdr.de>; Mon, 23 Jan 2023 13:45:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjAWMpY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 Jan 2023 07:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbjAWMpO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 07:45:14 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857CC23C43
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 04:45:09 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j17so8937601wms.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 04:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oo2LtwevuJO23VOS8HqpfBp/blUHr1Rd4r3O8NDnc/w=;
        b=Q7DVC9HbJXwYwY8CiNUTYudk4g7PiDlEKjDIANm4yn/GvB2iJYeih+XuwTWvJsWVWN
         0lVwAx0QTOZPny7lmvlwNoPG0Z0FvOvtyE7Xl4+QeqdIwPAqwAWFW86EzaxdyDSmZ8xg
         1u11mu8MuJwgvX9AFkSTzKmsRX4S2AhvAHf1RFGghNsNCh7d7suzVkF4lTdr/Yf9Ktps
         /IwYn1Wj/z9QODX9H7Vzh/LilZOmYKhkz7IDPJJn+ELrsk3hpkMwZhIvs5QxTlQvcWtt
         atCfOEmi59i59t9ErkqCH468luGLi7BJs0OnLeY+/+IGc9pbsZp8G1S3gmBTG8tn2BqP
         QGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oo2LtwevuJO23VOS8HqpfBp/blUHr1Rd4r3O8NDnc/w=;
        b=40rg2t5zSaMoVfPyl4kMXbchMVF+3BfmZ0ikyFrZieEq+xe7s0xM5EGRDjv5hFx1ck
         YzfSeKJZxi8sp6w3Ef9tj3Fl/rf+g1jhfhPpGfNxTnOJThYkDJHmOwpMZuNxDQzS0u7U
         i3D0/QBAeyV1J6PJWkFJFf9AycR6mn1a0i8HIdMViBC3K8pwBeDvcNlCHxHk6achgLVD
         98G8GunZLJxWfIooTUdfMaObdTXS3Y7N8M5trZ9wabR96Az2qfpLevUoSpqigNsK8l6f
         wIKbP6IMrnNuzv2VOETGNWy7Xnm7hXkr/6WP3eznTVmTN3TJiwQEOcapQBGubsGmRx09
         yenQ==
X-Gm-Message-State: AFqh2kr1QcqAJF/qL1uCdSC6oiXYXRDCoG2kAwpydt6R7IpDpi9YMZaI
        O3LUyJFNTZTxMuKswzXeIiVQUQ==
X-Google-Smtp-Source: AMrXdXvjsmkwmlyO4IK8FJN26tyIYSF2z/ep1upJFH/ZQJDcQ6QY6178NhHdNfOTlmlSPSWyE1Gp+A==
X-Received: by 2002:a05:600c:4f86:b0:3db:15b1:fb28 with SMTP id n6-20020a05600c4f8600b003db15b1fb28mr19945075wmq.19.1674477908092;
        Mon, 23 Jan 2023 04:45:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003d9fba3c7a4sm10540433wmr.16.2023.01.23.04.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:45:07 -0800 (PST)
Message-ID: <0cee46b0-445c-6e9f-3bc3-50a107cbaf4a@linaro.org>
Date:   Mon, 23 Jan 2023 13:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] clk: qcom: restrict drivers per ARM/ARM64
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
 <20230123094925.54824-2-krzysztof.kozlowski@linaro.org>
 <9cbbb9c3-f645-0066-a505-35cc7ae087bc@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9cbbb9c3-f645-0066-a505-35cc7ae087bc@linaro.org>
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

On 23/01/2023 13:31, Konrad Dybcio wrote:
> 
> 
> On 23.01.2023 10:49, Krzysztof Kozlowski wrote:
>> There is no point to allow selecting pin-controller drivers for Qualcomm
>> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
>> kernel configuration more difficult as many do not remember the Qualcomm
>> SoCs model names/numbers.  There won't be a single image for ARMv7 and
>> ARMv8/9 SoCs, so no features/options are lost.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Not sure about the newest of the newest SoCs with Cortex-X etc,
> but older ones, particularly including 8916 (as some vendors
> in their infinite wisdom decided that shipping a 32 bit tz is
> a good idea) having ARM || ARM64 would make sense.

Why? ARM || ARM64 is implied by ARCH_QCOM, so what would it give?

Best regards,
Krzysztof

