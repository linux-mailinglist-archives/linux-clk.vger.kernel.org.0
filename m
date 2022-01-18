Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C4B492D6F
	for <lists+linux-clk@lfdr.de>; Tue, 18 Jan 2022 19:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348116AbiARSgb (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Jan 2022 13:36:31 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43718
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244708AbiARSgb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:36:31 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 75D3740049
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642530990;
        bh=w02tDZQ+/pH82wJ+2+I78HX4sDJSAL6/sGojUN+hxrc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Tu3F4Qg+6zWcNJ4EVCcntHpxZkEA9mTjxy5d+l/Q5k8WsmTcOR0oOXTvb2pFascpE
         BxgXL9AFgAuYrvSBD+WmuzfMQkSRLNPZqISfGkqVfohsEKnWKLnkYfa3YBEIT2QLfu
         uQSJLuN2u/V7mjh5HqKYYdqM/j9QzwV2c3Q2wL/82hHkOA8uhs3rrsdJRM/zXHh1TZ
         TbuPWIVjP5e1OW0mR0JwyM/pPXvJisQUgupBsqRe4CuWJaT1RTiy0y9S7bGEBXCA0R
         tAQvLhVx+LZmAqvE/s7zSQ5iZbP3n+3aT1+zX5yuLmv/7ehMFNlfiuziAjaa96WnUo
         +2g4uu6f+I5Eg==
Received: by mail-ed1-f69.google.com with SMTP id t13-20020a05640203cd00b00403cefbefe7so1057395edw.7
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w02tDZQ+/pH82wJ+2+I78HX4sDJSAL6/sGojUN+hxrc=;
        b=ZAwEPv7uaUB7kxB4zJWRqGbbkNJyCGc9of2CIZ/IuEtzT3bHj5HJVDwvojUOyNEgPR
         AGayptlDG+V0Q/vvYSyJctezUpiRB2u2XmSoWgMYScuhvtiXj1UwLg85ehbmzh3AlT1l
         WocGdLFp2xEjCEAjDUSNg8ennVzwQtWOyfLUt4RDxBZif5lwrM3AIszFzpTrfFFumQqq
         N3jRnGsLtrTTkiuiPlQmfVPIXvB5FZu1bpbPgEMGLWsPJ+I7QOrc63afhcmQoSFeTQ4R
         Qj9/F7DpLdV9LQYue4XJ8J6YAlBps6Ez2AnM9i0vMv05n6C7vvSSWr/ufbvuIfDAekPV
         yrAQ==
X-Gm-Message-State: AOAM532BUVzkhW0v0nU5FPnMy+pTLT5B7oEaOM8ttiHwX0AJp7FWXW/d
        jrKBM7Llpec/RD+cwarXlXYosZI053jYJIjJDcQbbUftiIakTabYNE9ylt5tA88HZoEe79We3+M
        BF5fafKT3qhY7K4rneh4uxTD9J/J7SYCwrbFsMg==
X-Received: by 2002:a17:906:3089:: with SMTP id 9mr6146675ejv.97.1642530990168;
        Tue, 18 Jan 2022 10:36:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW896kEW4pez5FlRcPHEYDykkoKWgKvQ+E/L0nIduQnAXBmjtujdVlK6bWZIzQGSOLeSF/uw==
X-Received: by 2002:a17:906:3089:: with SMTP id 9mr6146652ejv.97.1642530990018;
        Tue, 18 Jan 2022 10:36:30 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k21sm187552edo.87.2022.01.18.10.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:36:29 -0800 (PST)
Message-ID: <c64aef61-ae6b-8483-5f9f-7bbace0d2690@canonical.com>
Date:   Tue, 18 Jan 2022 19:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 09/16] clk: samsung: fsd: Add cmu_mfc block clock
 information
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Smitha T Murthy <smitha.t@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150048epcas5p3449136cf0dbc2186d91c4472e9df68e0@epcas5p3.samsung.com>
 <20220118144851.69537-10-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-10-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds cmu_mfc clock related code, these clocks are
> required for MFC IP.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Smitha T Murthy <smitha.t@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clk/samsung/clk-fsd.c | 121 ++++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
