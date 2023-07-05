Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6046747D0C
	for <lists+linux-clk@lfdr.de>; Wed,  5 Jul 2023 08:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbjGEG33 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 5 Jul 2023 02:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231635AbjGEG32 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 02:29:28 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71AD10E2
        for <linux-clk@vger.kernel.org>; Tue,  4 Jul 2023 23:29:26 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98de21518fbso722854266b.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Jul 2023 23:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688538565; x=1691130565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phyxHLO8a7moEZO+PoNeY0JF8+Azz+17t0Pevgwhi34=;
        b=xRBAWRwzH66vlfdqYnjOsrYIrhpnBsxVWOa97RDb+Zg6xUTnemUfZLMfc/iG9AvICy
         JYFbbTdNV2h2/vE0WtWB0THDl0yXMWrsHNMevPqwx48HSKYv6nhQw52LZlhtVZUDazWz
         C8iYnssufhqGFSxVPBvfUD4r3bNoOGEc4DEW0ZHmOV1lV5PQvQ8/HKSCU6QcsryTUu1/
         pbnVnc9In2GmPCxxa5QE00KGjQIZJQI6h0Q3rqaqg66QdW0TVvoor+BU29Y8A+l8fjwg
         l+0JT7icaJz0BR6GomBTOAQxXWhqLCTXyo5+s6HC5dF6B2t4vfWKF/tbMe77E+BXkPTw
         vyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688538565; x=1691130565;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phyxHLO8a7moEZO+PoNeY0JF8+Azz+17t0Pevgwhi34=;
        b=Fi6sduxFrRDjK7i6JxztecHXNU1SuMRJuTNGX/u+07feRsdQZcZ2rCdQGn44qND534
         aGu0d+gKBXDb6GDsRJfvL3le9Uj1BLmOqkqBHy6sS9yj4yTOUdUp8Ep00ZIzpB446Xwj
         iZcy0qY9ivZOQKS7KU5rn+UcJoBmN53QWBrb1kfwbdQwX1bPP2+lTp2MG+9G1pTMMOQ1
         gR16rNwDsWsAtnDSF65tbTcTu02QWV+WrkRheUPnPR18/7Ro0NNKaE+n4rXddPK09Ara
         bKgSH1mFZ9mC9PH3v1Cia9CjoVRdnI6Dv50rUReNYjRaImSKFEbBmWwzNSTBk6wjgTo8
         O0VA==
X-Gm-Message-State: ABy/qLZd+xi/iFdO+G6plA4Y3i322l1NjEA4YtjjPgs3QxvkI50u/U85
        Xv3TxmjJ0gVUpIaMwqvd5eZavQ==
X-Google-Smtp-Source: APBJJlHYdTo4z/hlkFHoQa2+NZRZl1eD9iH9atBU3yCR3z2OgkJm/+XjFDGMziiDwRH6M40eVek78A==
X-Received: by 2002:a17:907:20ac:b0:96b:e93:3aa8 with SMTP id pw12-20020a17090720ac00b0096b0e933aa8mr12138305ejb.21.1688538565237;
        Tue, 04 Jul 2023 23:29:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v14-20020a1709060b4e00b0099251942e1esm9446516ejg.119.2023.07.04.23.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 23:29:24 -0700 (PDT)
Message-ID: <8f381404-159e-2000-c5e0-2b9ee809b4d7@linaro.org>
Date:   Wed, 5 Jul 2023 08:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v6 2/7] dt-bindings: soc: starfive: Add StarFive
 syscon module
Content-Language: en-US
To:     Xingyu Wu <xingyu.wu@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        William Qiu <william.qiu@starfivetech.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230704064610.292603-1-xingyu.wu@starfivetech.com>
 <20230704064610.292603-3-xingyu.wu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704064610.292603-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/07/2023 08:46, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Co-developed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

If you resent the same buggy code, then it is still no point to review.

Best regards,
Krzysztof

