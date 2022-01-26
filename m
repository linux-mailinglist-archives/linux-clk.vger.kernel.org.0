Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16FD49C716
	for <lists+linux-clk@lfdr.de>; Wed, 26 Jan 2022 11:07:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239598AbiAZKHJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 26 Jan 2022 05:07:09 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48772
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239599AbiAZKHF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jan 2022 05:07:05 -0500
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 34A453F1CA
        for <linux-clk@vger.kernel.org>; Wed, 26 Jan 2022 10:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643191624;
        bh=oThQwKFK6XtH78HFKeqJt+QV8RxriJyyesSRLsPqsDo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=X6VInlb9equJdSVZo/rLFFxsxpesnnkmZgsN7jIF4D/pAz7SDZccFwL9/otbb7R09
         BgL4/EyzU0SWgLMaFD2iJ1DPzvaka4h3yGCRu6kILu7Hoj3XyAmLGeABZbAPsckkBh
         5Vy7wRLlhSFduMiYu2AZiQVTz2Y20+0mxDIWWLnztkBnbolxVLXfi/cYtMPJqcwjyh
         SnPX+A9NU3hAaf/2aiKTPTqIyUj67Am7SE+jJfowQmS7sP7aFCXBB6tO3/8ENnmGlR
         52onQDIzoiarrCRpkT1g+F201JaX2qB4cM0kMQYuZ8UIdPeSA6hvVPpctUFT6iwB79
         2fwP3GejNVSzw==
Received: by mail-wr1-f70.google.com with SMTP id o26-20020adfa11a000000b001dd1d3a73c7so1636639wro.21
        for <linux-clk@vger.kernel.org>; Wed, 26 Jan 2022 02:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oThQwKFK6XtH78HFKeqJt+QV8RxriJyyesSRLsPqsDo=;
        b=EJJ2Fe89Rq3oIw+Ewp94us2wnuDEATy1/imvYs+5Y+kTlGQYY1/EINwdZerBRpP7jP
         kSIq2qNWjDVZPoUckLZf4gIb119BPwzUHhJ7WqP9rtO7Axi4hnXA3eqft1+fHQu45/Rd
         +S+JZNZ/Za9X6ptYyQYschvl6nEhHQSlFI2JuJgU/Fh7W0XKhJ4DLHEYkJ5z8GrK/oqp
         um01C5/oM2ek6eSOeRkPjoorY9NYv8WqWhlNDG91diEsFppaU7d0gySLrKGZTv51/aA1
         qp1IL+OHJNBZ7tAtfBVS1FIwg++rPQ3n3hHGc/RpHb4pPc+auKtYOuzE9EYrcMNuSv1o
         eZlg==
X-Gm-Message-State: AOAM532UR9n3QXj1xCifyIo4TSO7WqK3JeqfdmWnCPpDvbx36YQPTsxo
        KGuf8AEqyIOoR/8OqHJdUI+tIWUuFbljlwMfUNobsLGGjZWop6f8cAB1cdlRCy5fi05ndx0kExx
        Jc5Hf/zn1X0JoFcuRaF7uq70Ch9BO1wHWwHeDUQ==
X-Received: by 2002:adf:9dc1:: with SMTP id q1mr21173659wre.18.1643191623800;
        Wed, 26 Jan 2022 02:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV0sFlu+SrQTxQBE2KhEDN+8zL3JXHMXbU1Ir6hw/UdQcRSePD5dTyyFBY+EHUljlB23+Ibw==
X-Received: by 2002:adf:9dc1:: with SMTP id q1mr21173645wre.18.1643191623674;
        Wed, 26 Jan 2022 02:07:03 -0800 (PST)
Received: from [192.168.0.60] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m4sm2765984wmc.1.2022.01.26.02.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 02:07:03 -0800 (PST)
Message-ID: <c1ad0ec0-74c2-08fa-ecb8-ea652cd96849@canonical.com>
Date:   Wed, 26 Jan 2022 11:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 03/16] dt-bindings: clock: Document FSD CMU bindings
Content-Language: en-US
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, sboyd@kernel.org, linux-fsd@tesla.com
References: <20220124141644.71052-1-alim.akhtar@samsung.com>
 <CGME20220124142905epcas5p33a863799819fb904932d2e88c682940a@epcas5p3.samsung.com>
 <20220124141644.71052-4-alim.akhtar@samsung.com>
 <a611a070-4932-1691-1f20-7cfa8bb96cc1@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <a611a070-4932-1691-1f20-7cfa8bb96cc1@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/01/2022 10:13, Sylwester Nawrocki wrote:
> On 24.01.2022 15:16, Alim Akhtar wrote:
>> Add dt-schema documentation for Tesla FSD SoC clock controller.
>>
>> Cc: linux-fsd@tesla.com
>> Acked-by: Stephen Boyd <sboyd@kernel.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks, applied with all other clock driver changes.

Sylwester,
They are on separate branch, so I could send you pull if needed for
conflict resolution. Just let me know.

Best regards,
Krzysztof
