Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D013DBBF0
	for <lists+linux-clk@lfdr.de>; Fri, 30 Jul 2021 17:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239521AbhG3PSw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Jul 2021 11:18:52 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35150
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239344AbhG3PSw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jul 2021 11:18:52 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 983953F107
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 15:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627658326;
        bh=uQz9tULPCu5UgY3Ykcp4Ot2UDuSXdhe8Cf5AChsFwuk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=bGggyeAsHZoe99MUNqYYPyGTi8QMtb0yCvsD9bAAZ/Fr8LMUYIx8QrjuvDrjqQwKF
         4Z4l7Mdo3XEHJyud6uhVFXIKZoBe4oZ0eY9kwIRg1PyNyvb54QqQrsor9Q9YOJM2OP
         YTS43aHA1sNay/hbtdPUId5HbnW6tqQ32ZhRgzUAaW/k15tpMjpgSA5llqYEIwWtmM
         ReaiX4TxzMw2HcWmPMM0XzB0Yf1HnK4JOISkWdv0cRRr2cA0QlErgnhYlJ5B+g+5zT
         foFIqteMe8eQC/6hlTJYXzhIKM/gL59j8YprrSK08FKNADfv2MfU3JbptKNjDWGPcp
         NMbFtzkS2RhzA==
Received: by mail-ed1-f69.google.com with SMTP id c1-20020aa7df010000b02903bb5c6f746eso4741432edy.10
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 08:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uQz9tULPCu5UgY3Ykcp4Ot2UDuSXdhe8Cf5AChsFwuk=;
        b=NCer5fy5LducN9B3YGN5qyf5crUyCfa+rCUgeEdzjWARJ9N38o2ZbBod3gtpe2qXsV
         UdEqPlA3eylKM0D6SFoTBvrxVy0xVhMytOtmuPOAwZW8j+ltkUQUvCDolCWHZmxxz2FW
         2x7bwC6NPE0+7kgCTPW0rE9BLXNdQDMnV6+f137PJNjcHfiFQUsUOS35Ipq2cC8W62jw
         sa0xTmjIUKJf2Y3xds4LswHq5E8fcF45cUtXsHk+xnZVLTDECOGBymblTu+UEpsTDAxy
         IwS5bm016uGsnRPk3y5Wza+JB96Ty9+G3VRTjnX8JFE8/xkpu0IuTXPHfeAMialnsjW9
         Souw==
X-Gm-Message-State: AOAM530JYhqaSz4O1kg2hfNYDW+pg0n9T7Y1QCRF57rav4cc7FaQ9wsd
        oQBd+khNAofo1+cwRnfWooG8xhUZqFUv+xkD7IP7DrRXqpzYQM/Ea6AbWUdhfw0t6ezLbIDW0zk
        H0NRQyQNbjYlNxONPMWR9VUTj2GPjefkRw8bNoA==
X-Received: by 2002:a05:6402:3192:: with SMTP id di18mr3654257edb.186.1627658326388;
        Fri, 30 Jul 2021 08:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSu7DW5+j3BhrkN5cwojsD8uD94ncil0rrItmiexSqoVvOVwhkjvCksZc4ftgx6K7DzkIA9A==
X-Received: by 2002:a05:6402:3192:: with SMTP id di18mr3654233edb.186.1627658326270;
        Fri, 30 Jul 2021 08:18:46 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id f15sm824270edd.54.2021.07.30.08.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 08:18:45 -0700 (PDT)
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Date:   Fri, 30 Jul 2021 17:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> This patch series adds initial platform support for Samsung Exynos850
> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
> rootfs as a RAM disk. More advanced platform support (like MMC driver
> additions) will be added later. The idea is to keep the first submission
> minimal to ease the review, and then build up on top of that.
> 
> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
> 

Great work!

What's the SoC revision number (should be accessible via
/sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
might bring confusion...


Best regards,
Krzysztof
