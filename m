Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB3C43B4DB
	for <lists+linux-clk@lfdr.de>; Tue, 26 Oct 2021 16:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236965AbhJZOzc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 26 Oct 2021 10:55:32 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39442
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236058AbhJZOzc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Oct 2021 10:55:32 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99E834027E
        for <linux-clk@vger.kernel.org>; Tue, 26 Oct 2021 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635259987;
        bh=FLFyjOECX2AvNUG03Y16Xa3yjaSG0p5S8KEMYABunrs=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=jrY61ghtCUmCMt+Khqongv7L6q1zMfjDjlL5alnq3wwWwnFqr1Ku1MouPEK5P5Fs4
         zMvHvF6x3vdUjq027iUh21GSun/KfqphOs5SW8iZDwj/I6jozr6h29JZw7dnmEZGfM
         7qlQKRfOfL7ZuPmxZ/iLNB6qtEjwqBu75qE8cMQkUAgXRkdmpcRe14JwkmWxrjv53E
         a2N2i0Z3MYhuqE+CJdtLm5qood8dwBJzIEhJa478X/AlTOv83tl3NqXdPLW5M+EgwO
         ShUurdwrCy1baZFHPgIMgUdkkz1WN4yNusfNEQpzle5W5+PhKSnJwF3QeLw9Wk9t0C
         nyCzxFSRp/Qqg==
Received: by mail-lj1-f199.google.com with SMTP id s5-20020a2e98c5000000b002112895b3f6so4489539ljj.21
        for <linux-clk@vger.kernel.org>; Tue, 26 Oct 2021 07:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FLFyjOECX2AvNUG03Y16Xa3yjaSG0p5S8KEMYABunrs=;
        b=VUfeX329WIBkmeytzSb+5xywgFncaI7AOmfTkvKrbs44p7dbEAujXBbz7Xr4CjccK8
         oHr0zbIP5VjhpUu9QICw2PyTDrrHKpmwr5dchwhReQE13ZmZGxxk1GRJMciPbuUMndXZ
         hRcdwk56b8T3fmx7YCyBA7Oy/nI+OncGDalbJ1ZJe3sv1eYmbQN3AbUdepWc4KUNhRDA
         Vo6V+7HrHlOthGD+QnLQctuv4E+u48Y0LmmQSCk6DYSb7dzBIkANqSh1oEttY4r7nA9h
         hbJKrnWVYWFfq/sXcu47NLSNg28YWDPcErvySdmLOVWnaKTffVIPSxnWytXplcFCTq93
         ABdQ==
X-Gm-Message-State: AOAM532XxHNRr9cckDpvAiXnSFEB1vXhXZXiaV5RrWGZNrzm5JgbDSGD
        k8kPgQyem0M2wtkIEjociOg2bJ3k3w5qntHeAKSqYceO2qoUdCCE1lkfCjEcCcWklqyTxk9qHv0
        1IWPBU8J5I9eE3beWjxbx3j6QJVmFCOY+a9cELA==
X-Received: by 2002:a2e:b708:: with SMTP id j8mr26414030ljo.466.1635259987031;
        Tue, 26 Oct 2021 07:53:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7yFHlYp4WaoDp3jQHqEZPyAcBTUqWSTqaKAo9daRd2erHD77YdKOoek8eu9IXM/FCwnFEtg==
X-Received: by 2002:a2e:b708:: with SMTP id j8mr26414005ljo.466.1635259986876;
        Tue, 26 Oct 2021 07:53:06 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f8sm1956093lfq.168.2021.10.26.07.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 07:53:06 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] clk: samsung: exynos850: Register clocks early
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211025161254.5575-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <cc106f70-7352-c1e3-7bdd-72e070877be3@canonical.com>
Date:   Tue, 26 Oct 2021 16:53:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025161254.5575-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/10/2021 18:12, Sam Protsenko wrote:
> Some clocks must be registered before init calls. For example MCT clock
> (from CMU_PERI) is needed for MCT timer driver, which is registered
> with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> clk-exynos850 platform driver init, it's already too late. Inability to
> get "mct" clock in MCT driver leads to kernel panic, as functions
> registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> can't be fixed either, as it's acting as a clock source and it's
> essential to register it in start_kernel() -> time_init().
> 
> Let's register CMU_PERI clocks early, using CLK_OF_DECLARE_DRIVER(), and
> do all stuff relying on "struct dev" object (like runtime PM and
> enabling bus clock) later in platform driver probe. Basically
> CLK_OF_DECLARE_DRIVER() matches CMU compatible, but clears OF_POPULATED
> flag, which allows the same device to be matched again later.
> 
> Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
> ("clk: renesas: cpg-mssr: Add early clock support"), as well as in
> drivers/clk/mediatek/clk-mt2712.c.
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Register only CMU_PERI clocks early
> 
> Notes:
>   - This patch should be applied on top of CMU_APM series
>     (clk: samsung: exynos850: Implement CMU_APM domain)
> 
>  drivers/clk/samsung/clk-exynos850.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
