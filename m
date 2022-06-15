Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4245B54D03A
	for <lists+linux-clk@lfdr.de>; Wed, 15 Jun 2022 19:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349041AbiFORnO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jun 2022 13:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346898AbiFORnN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 13:43:13 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3119645075
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 10:43:12 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y6so6428458pfr.13
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=MGIXp3QQnrPr2FjVt/U3vBNoRdK68EfU6LQ0hfSMUL4=;
        b=RGCQ4Brqua5VFRNXzB2Bl2Hn0N1OibZw7EqR4vkm52jNhv3xqmk3k0STCcIbRoGg58
         uoIOPX0ey/i0ZFT2NOyyMB+YPGyT/xqNRjmRhi/aH3YVQ2wBA0GKAbVrWkRVS+XwdgvR
         hmwqZRgeqASAYZ8cNfSQXmbitEilH+LtVhQqFYyM820Z3UVJvQnUKh0j9urraxiKDlOT
         C/1TMPtO/EJQnsSBewdvzcsg8JsWF27I8arIY7bWTzQWnHyRtBv7th4ntybnHMo65bF6
         qBLUqAZMaRCzLKvLEt5V4U5VsztBSl+EbortBszhEV+eYxD9MK+oFZMtIfaGbT6iha7W
         P2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MGIXp3QQnrPr2FjVt/U3vBNoRdK68EfU6LQ0hfSMUL4=;
        b=sf6HKMNcshPDpJP7A4X+cajlAeJa86FoF0ReiZMAp8QX02TlOC5M+YeW7qciw6l0XO
         RGyjFarteqWOUdmtJlG2TUBZDAj7IHQNh5HDGAmnlXQyfdkDOyBijZfZ9I9aEBoC1bn7
         4oM1xYG8u2BIlYN2Tk/rBuC/9jvRHXZb6bDkL6Gp4XgqV/IjPpedbIsv4Cl5Tc5JTIKj
         xKlaVc9Y3m4+mM4sbmAbMk6JfLf93wrb9qipaqbUqzN6pnbJkuV7XvRAC1ruXMJUFDDb
         xYgnM3+65lzIucO5kfa3cA7D5ChBW+sunUcHUzg0Sk35eVeYy8ztYy+Pjbrlm40jruG9
         lmog==
X-Gm-Message-State: AJIora90NE9ZU09LVfipb19HuMEz638wyEhmIZY7cc1EUQyNsW0LnPgI
        PBDuDxHsB7wX54FUeO4NV970Hw==
X-Google-Smtp-Source: AGRyM1ugV7Z1jI8FRgQThkABnCGlJIcvgGVKwX50uyrHXDaYc27/9se5ycVDzY8kV1ZsGL2qBopEbw==
X-Received: by 2002:a63:951b:0:b0:3fc:98c2:4301 with SMTP id p27-20020a63951b000000b003fc98c24301mr787931pgd.515.1655314991688;
        Wed, 15 Jun 2022 10:43:11 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id d133-20020a63368b000000b003fe2b87cf03sm10271697pga.80.2022.06.15.10.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:43:11 -0700 (PDT)
Message-ID: <a92fe431-a995-4c7f-b90b-8e80298bc71a@linaro.org>
Date:   Wed, 15 Jun 2022 10:43:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add pcm reset for ipq806x lcc
Content-Language: en-US
To:     Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220615163408.30154-1-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615163408.30154-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/06/2022 09:34, Christian 'Ansuel' Marangi wrote:
> Add pcm reset define for ipq806x lcc.
> 
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
To prevent any confusion about identities (we have strict rules about
these), I need to ask - who uses this email address?

https://lore.kernel.org/all/?q=ansuelsmth%40gmail.com

Best regards,
Krzysztof
