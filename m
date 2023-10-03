Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1BE57B6423
	for <lists+linux-clk@lfdr.de>; Tue,  3 Oct 2023 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239293AbjJCIaz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 3 Oct 2023 04:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjJCIaw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 04:30:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5E7100
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 01:30:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50481a0eee7so4935948e87.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696321830; x=1696926630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Upai5QPyYhZqvlPnDXtxS/IJLPhOhdON/NIKGQEvYU=;
        b=iiDuskM0u7fMq+7zUoHpz4SndOdtQoQK3zWpH1W3BqfBQA/rVVwORu4MkGWyNpna28
         0mqeJYAl5iyDwyMpP5ku0TZ1gyOlnS5ab3BS9DYogsLkePdUR5ocY3g1pIJaNN84JTQY
         XfNHDXKcWYtsgeq1dkipJRciwgtJctedqYVh8dQ0t0bww/AEFoSS9R5lHNsJ9sxk1ACc
         G6GtMTdjgWIDEolA6UmpKfGuVpVPqJQ/QrUiEeAxnGKZo5psRK3rrucX1KRyQu1PPsUy
         jQtJaijXgnYGMxKsTne5xMs3GPN3Io97XcKMFRFiw0ZAmnCIZtYT9r6uQmex/2Sm4mrT
         UgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696321830; x=1696926630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Upai5QPyYhZqvlPnDXtxS/IJLPhOhdON/NIKGQEvYU=;
        b=giVYC8l4LUqWbMkF8+6ktzo/rYinvfw0xXWcif9KIMErAIESO3IEiQ2bTKFr+oC2ME
         yJDL4J4u1UqyBhxxYHBeKZYovxNKVMC1UPyQMpuhKwXXEOaIiu/CD2rAmO1/lQxoen2Q
         ahSGdLKBDVjU0oFRJJKW/Kz4xDGY4kcbMrUHjhBdL3CK37MhZpBOF8vuX3bY1xWtPfSj
         AgdYhWr0w9d4Y04sRAB5U+hod3aG1q074MSJdbOQsCEANDnN+vvtB+b5LBQrx51E+W/k
         BHFAEbyEmvDJ+j4ZiJvZVU3TS7cdtyg8IguV/qbcHV7UX3Dcau7KI2HGjlleBG+FYOIl
         rhgQ==
X-Gm-Message-State: AOJu0Yxtq0z1dIVF6J36ba0AVTyn1q6Fb9brT4HLHqgaXkH0t2t2OR2H
        oinm4bZcrKM+NOYvrhS4pE+ifQ==
X-Google-Smtp-Source: AGHT+IGxRj7o/xKxQnfARL8kw7LPsBap9THlWkCKqS+Sj7FzwYabnhEfXed4ig9109nAC5QpgutbFQ==
X-Received: by 2002:a05:6512:10d4:b0:504:86ae:5851 with SMTP id k20-20020a05651210d400b0050486ae5851mr1655723lfg.23.1696321829840;
        Tue, 03 Oct 2023 01:30:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g8-20020a19ac08000000b004fe48a27fa1sm108239lfc.114.2023.10.03.01.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 01:30:29 -0700 (PDT)
Message-ID: <7312633f-3b53-43a1-b6e3-010513c2a1e2@linaro.org>
Date:   Tue, 3 Oct 2023 11:30:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/23] interconnect: icc-clk: add support for scaling
 using OPP
Content-Language: en-GB
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-6-dmitry.baryshkov@linaro.org>
 <493aff10d698c9ca5bdbeae45250f5fe.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <493aff10d698c9ca5bdbeae45250f5fe.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/08/2023 21:09, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-08-27 04:50:15)
>> diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
>> index d787f2ea36d9..45ffb068979d 100644
>> --- a/drivers/interconnect/icc-clk.c
>> +++ b/drivers/interconnect/icc-clk.c
>> @@ -25,12 +28,16 @@ struct icc_clk_provider {
>>   static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
>>   {
>>          struct icc_clk_node *qn = src->data;
>> +       unsigned long rate = icc_units_to_bps(src->peak_bw);
>>          int ret;
>>   
>>          if (!qn || !qn->clk)
>>                  return 0;
>>   
>> -       if (!src->peak_bw) {
>> +       if (qn->opp)
>> +               return dev_pm_opp_set_rate(qn->dev, rate);
> 
> Just curious how does lockdep do with this? Doesn't OPP call into
> interconnect code, so lockdep will complain about ABBA?

Unfortunately it does. It seems, the icc-clk is not a proper way to go 
here. I will take a look at reusing set_required_opps for this case.

-- 
With best wishes
Dmitry

