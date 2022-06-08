Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4C7542D0B
	for <lists+linux-clk@lfdr.de>; Wed,  8 Jun 2022 12:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbiFHKUT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 8 Jun 2022 06:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237281AbiFHKT2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Jun 2022 06:19:28 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72BD19CB7E
        for <linux-clk@vger.kernel.org>; Wed,  8 Jun 2022 03:07:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bg6so20624133ejb.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jun 2022 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uwozKY9IoRm2unnovWBUEXcVhf9p+HCIyh3s3hKT5vQ=;
        b=n0VfOVvrrkIOalvK8xRLNFd+esu27i0xirYjW+RFkVQgVZkWh64Mdjk79XeqZN+QCx
         JnHT3RcjJr3UaQPb6LgQ3RZk0rjuRV+faz3KnWChGXk6G9EUxkgeHDb4Qw/tf6LSNq9D
         SuVcBOGqn5ZgSCpdMmNVyJYTALMQvU2itIy+wujWAr/Y1hMKkg0xg7Pbx5JqzNFJeSvI
         oa09wBRQbWLCuTNSxXg2tg7FWkoZbnRc+p7wdumlA7HhZoXgPHvTTljGVEneASCRNrkm
         F1HUPHlWw9SHP9ATOsCLyR7lcAVMk6kMkLkIJwROq3UooMafbV6X7xialLi4KFOLeo8e
         kTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uwozKY9IoRm2unnovWBUEXcVhf9p+HCIyh3s3hKT5vQ=;
        b=uBTVGyV/QFFGei4WcYSzD0ljclbucaEIicn3sqXLrAHLxNT9q5mCdf2LbbvVekmOEw
         cqCRr2iNiNwdLi5Pl0Baxe4z4xo6OIyNcKcinHJvD+sb6wuSgMZ0E5nu0j+m7OeWZI78
         Sv3VY8182Yq0GPudYohKGRZ57bYTLemCps9crhhC+K5yu1WqyeTcqN9SLJFMuFPeeE8J
         MKQusqtoGyegkQ5PYLUq45dnrT7LmmDz5ta8Q/ZglMpBnmd7h57tjZf9ZJHruPQMOnyV
         AYWQZWR7W+M0iaoWOu4UIRn7u6VYGQ3OUnx6Jq5HoyJqAODvua1a5tFvO+1SONueQMNw
         4DOg==
X-Gm-Message-State: AOAM530UFMw/SZ3BlSBykmYbEF53pwydXpm3gXTYyGztdApGQQ5Gdzv+
        c4XuXPoKJaln96DJfaZr9VXlcw==
X-Google-Smtp-Source: ABdhPJzDQJRXBOzErKRVkLtw792RnQ9hYbK6BqKk+RLDWlTglkhS2dUR49w+HXT/bwY07t0Tq6uriw==
X-Received: by 2002:a17:906:9f1c:b0:711:cdda:a01f with SMTP id fy28-20020a1709069f1c00b00711cddaa01fmr14516948ejc.372.1654682827093;
        Wed, 08 Jun 2022 03:07:07 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ay25-20020a056402203900b0042cf43e1937sm12020228edb.75.2022.06.08.03.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 03:07:06 -0700 (PDT)
Message-ID: <3aa70c91-d6d7-e2eb-9c45-a1fb0a5751ca@linaro.org>
Date:   Wed, 8 Jun 2022 12:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 10/20] ARM: dts: nuvoton: add reset syscon property
Content-Language: en-US
To:     Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com,
        tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, wim@linux-watchdog.org, linux@roeck-us.net,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, jirislaby@kernel.org, shawnguo@kernel.org,
        bjorn.andersson@linaro.org, geert+renesas@glider.be,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, nobuhiro1.iwamatsu@toshiba.co.jp,
        robert.hancock@calian.com, j.neuschaefer@gmx.net, lkundrak@v3.sk
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220608095623.22327-1-tmaimon77@gmail.com>
 <20220608095623.22327-11-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608095623.22327-11-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/06/2022 11:56, Tomer Maimon wrote:
> Add nuvoton,sysgcr syscon property to the reset
> node to handle the general control registers.

Wrong wrapping.

Best regards,
Krzysztof
