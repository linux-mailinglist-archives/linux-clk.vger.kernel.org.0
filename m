Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3323662E9D
	for <lists+linux-clk@lfdr.de>; Mon,  9 Jan 2023 19:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbjAISU0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 9 Jan 2023 13:20:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237601AbjAISTk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 13:19:40 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1384730D
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 10:16:21 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id az7so9099472wrb.5
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZ+UcSvH1/yFH/DmcCw5T1cgnvux9jRR+4vdCZNHnV8=;
        b=g/2cZ66foHel6/6Em/n7eMR4GqyyKF5VFQLa1Al2lQkhnnsue8mhSixFvd7htRUIRY
         8ijIBWiPJmOl0Ez71XV2l0wGtXlQaLYBPYYrc5IvrCgr+Vcu5X6rqEDnZxETIWcVNizs
         mrJisga5WmPvLBH21Du83bWZuFI9TMiXpzf5JcYQY5Vr7Nc+rGO/TDIvwQKFYvBBor+s
         aaaMXPlteVo/Wzb5FOJIzMX1JewvkMcfGlx0/yjf8y9WVb/0iy55skA6dff2c4DOrjuv
         oEA4ZQMR0/ozXexHgyDEI4ACcsr8AGA+6Mtt6O8CagW1r+DKMxVaVVPhOQ9GksNnfTe/
         x4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ+UcSvH1/yFH/DmcCw5T1cgnvux9jRR+4vdCZNHnV8=;
        b=WfPQYxRaA/KYdibya5ymJW9EkHZVZ5JBJBU2MDz823eJJSgJ21YCBBl6CNBiqtgMow
         smuK9YMkT2ruNtKFDy2a0fyuTnqLdxmjhwyQUhhhfYiPcom0buFIGVN3lmhV8I5AdSdb
         YenW//Uefsfx9YQvXEDYk8MJ7gHBa6XRwbSqDnlrM7cWMA31+eY4Xcjarv2Q7RMoTsV0
         gWt5LuChNBT63bxWy9Ng8F0JB8a6ulmHSWvwuGBn+IWBK2PGugO/1+UrNLKOyYvjv7tt
         OqfCR9OKBRugonw22AnTuq8tUjl8dcm2WccfXC8+CBYeu0hDwSps/53O/N3IAfK3ECYt
         mZYQ==
X-Gm-Message-State: AFqh2kpcwMd1f3J/OmD2DIryMj7u2IE0OquxA12/+2e25j4wgIgC9txG
        GNJwl2gP0OxJVqgSs4IpATf1SA==
X-Google-Smtp-Source: AMrXdXvWp+uWmOkR4I+WvA3APw37a5af3OBw2MaJnBDtJFjrrt5W7j+NRUEHGx2JTxqFhl1RnFgtag==
X-Received: by 2002:adf:f80d:0:b0:2bc:7d3c:5a57 with SMTP id s13-20020adff80d000000b002bc7d3c5a57mr2110866wrp.1.1673288180257;
        Mon, 09 Jan 2023 10:16:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r10-20020adfda4a000000b0029a06f11022sm9118968wrl.112.2023.01.09.10.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:16:19 -0800 (PST)
Message-ID: <60dabb25-683e-2649-7045-d7504de7d128@linaro.org>
Date:   Mon, 9 Jan 2023 19:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/18] dt-bindings: clock: sa8775p: add bindings for
 Qualcomm gcc-sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109174511.1740856-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/01/2023 18:44, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add DT bindings for the GCC clock on SA8775P platforms. Add relevant
> DT include definitions as well.
> 

Ah, and same comments as for all other patches:

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

Best regards,
Krzysztof

