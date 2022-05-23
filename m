Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA12530AF6
	for <lists+linux-clk@lfdr.de>; Mon, 23 May 2022 10:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiEWHdx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 23 May 2022 03:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230357AbiEWHcs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 03:32:48 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318912DE9
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 00:32:45 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p22so24009143lfo.10
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WM2iSjOLNX4HMYT1KBJ2aGaH1i/fqUVeTTeRZ7BJWqI=;
        b=xpgnLsJaW+uiXjqcvBRtw1Ox3btq1Zpc6LoTPGuU+r+GEYHXTeZv1y5BsKu6YnI+lV
         rGii2wxRug/9TVgLd9KhL+MhCvqOKZZd81IFpx4Z1UnUNbLeVTtOKmVWMNWX80qopIpL
         NbyDgx39jmkQQWv42A3xhY8EOEwFA/bmBAwMyuMUocborhxaNUlNwTtyUWnPh6u/ILa4
         fFGtP295rUcnHZmb3yhcRw5jXHf/r6OkUeSCP75ebJ0Hdcflz9n7K3c6E04z8+HpYY8v
         P9xh0fyukxvZ5anO/cG8Woy8w337KFzZbpg0O8xWBLtSuPRYANQ/5O8SIRY9s0ku0Ye6
         W6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WM2iSjOLNX4HMYT1KBJ2aGaH1i/fqUVeTTeRZ7BJWqI=;
        b=OmMIgXSPWAgP59DjTLOVqwlYLnCdEj254HCQ6D4VNNXqkZ0s9mjYk3YjtyURcj56RJ
         oH/p1HWyxusEsGTRNeonD1yYHqM1fuzGv45MuocbGoVIP2S8BQFicuV4ytiL9cd/hm24
         BfC04Me0TEQRpdR0vRsHMPKNTWVI2Bwm/NkCLCcXojE2TZNcI+zP/UqXdndamuovOZML
         tR5QLVIAxyP01GUK9N7OH4HfSM8aMQnNBIpauXU2/KdYMJFIIE6myZuB5qnwU86Sz691
         HouKq5cLezLmaSTy7r+HQnu3jGUmMctrRucc8lp9adZdvH4BnS4JWtAw2MoU2amux2sk
         9PDQ==
X-Gm-Message-State: AOAM533SIPDHST32CJsk4ht7mXvjozH5AvD+5HFD1DPXI93mZMZA2Vfk
        kX5gDZWN85FiDXhiE2I/GbkFaA==
X-Google-Smtp-Source: ABdhPJxkJ1lbfwE/HFS0yyoqUL4vOqViZG1+sY1vIT/G+AZ35A4VLDbzopZna1vNMRo2bjalfVjU0w==
X-Received: by 2002:a05:6512:3092:b0:478:786f:9fc0 with SMTP id z18-20020a056512309200b00478786f9fc0mr1502296lfd.562.1653291163402;
        Mon, 23 May 2022 00:32:43 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g2-20020a2e9e42000000b0024f3d1daea5sm1666653ljk.45.2022.05.23.00.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 00:32:42 -0700 (PDT)
Message-ID: <828749d1-d0a6-7016-c36a-ace0bb72600d@linaro.org>
Date:   Mon, 23 May 2022 09:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 05/19] dt-bindings: watchdog: npcm: Add npcm845
 compatible string
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
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-6-tmaimon77@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522155046.260146-6-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/05/2022 17:50, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 watchdog.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
