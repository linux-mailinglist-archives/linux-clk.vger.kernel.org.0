Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8BF4FACA4
	for <lists+linux-clk@lfdr.de>; Sun, 10 Apr 2022 10:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiDJIOd (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 10 Apr 2022 04:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234687AbiDJIOa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Apr 2022 04:14:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08A521818
        for <linux-clk@vger.kernel.org>; Sun, 10 Apr 2022 01:12:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id n6so24966010ejc.13
        for <linux-clk@vger.kernel.org>; Sun, 10 Apr 2022 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FtELbYASsIxS0aQTgGGqXwDAZ/GpbndTchli/odvm3k=;
        b=gYBRVF/kBdNo3ij65pV2qlbIreM4cbzN/gCh0MV+6pP9HCfyM9MOvSck4PyIn9ivS8
         T01nzCS4cwJ+WMQv+JduJw+jO/5OOZiQCVabi0RqfbS0zQsRP0jRpuz3iUO3dXGYDgDK
         JFfgP0cmD2YwzbK4CZle/nnOVVlKL6AhLMxDoBbSnOnKzRx6zDOT1xuHfs4Mu1qX8QFW
         M36NJ9LhTUnPvB/uBADohvlD9G9we/OIYk79CEKEmaCPMbPOGS0/zroSyEY/e8qSvtbI
         g/IJdPneWDtxEWggm00OcjfBXP99I61MC0WoP70iLFMK4AOmUbTuBov152RngifrSHwQ
         DSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FtELbYASsIxS0aQTgGGqXwDAZ/GpbndTchli/odvm3k=;
        b=cVlr6c0cLDVCs2A7j0slhzbkDa/PqfliQBJ887Mkl7hSktgIKG+ZGUHNpMObsoVY8e
         nnUFI19MoX7zthY2jXJ8jEExD8Pg5B//puNVgUK+UndgZoCAtrKx168Q1SJBSTg3gN5m
         tIXm4DMjXzGLr8XTeXGZu37YQz1wsZyCWoWtKQ0hpu1e7muueGDWUgDhLnqGZ8YzHqCR
         5MsIh2YPxWhPffcVR0jd4fuXW0U5r3ByPDbaxImbNhR0JNi9CRBoNzV/ULuL+zdrXUXk
         u0/porGrB1OFNw1zExGqZpgRx2+BMmyDbCSqxJ0lhYzKgviqJbX3twkh/etKkKuxy+c7
         hHFQ==
X-Gm-Message-State: AOAM532XBOM9oePzVHWNDcgEqmFcL4wjz43tGOFYRzVM7Xd8fFcOJHHc
        pL4MWnEVIJ0APEcASoHqGz6nxQ==
X-Google-Smtp-Source: ABdhPJxsZUC9oxQbPCBUcyzIoMbQjfj3XeNiOb7tZ6MkaNwW/bpJ/JstEQ9Hp8nxvD3ij5ICrqtI0Q==
X-Received: by 2002:a17:907:6088:b0:6e8:62ea:1dae with SMTP id ht8-20020a170907608800b006e862ea1daemr8379303ejc.173.1649578338482;
        Sun, 10 Apr 2022 01:12:18 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r18-20020a05640251d200b0041d1600ab09sm3987710edd.54.2022.04.10.01.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 01:12:18 -0700 (PDT)
Message-ID: <c0ff5173-aad5-1814-6758-89d99e83b936@linaro.org>
Date:   Sun, 10 Apr 2022 10:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To:     Conor Dooley <mail@conchuod.ie>,
        Conor Dooley <conor.dooley@microchip.com>, sboyd@kernel.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, mturquette@baylibre.com
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
 <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
 <98026c4a-a065-3965-27f0-71de29cdb264@conchuod.ie>
 <7e6a0489-f90f-a362-e37b-b219fe2d71fe@linaro.org>
 <8a7e16c3-ce17-3726-5702-763d57075c25@conchuod.ie>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8a7e16c3-ce17-3726-5702-763d57075c25@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/04/2022 22:17, Conor Dooley wrote:
> 
> Do I have to maintain backwards compatibility with the device tree
> from before the board actually booted mainline? If not, I'll merge
> it all into one series, marked as fixes. 

Usually not, although it is not actually my call. :)

Best regards,
Krzysztof
