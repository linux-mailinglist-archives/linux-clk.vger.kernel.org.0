Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0B5607840
	for <lists+linux-clk@lfdr.de>; Fri, 21 Oct 2022 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbiJUNVI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 21 Oct 2022 09:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbiJUNVG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2022 09:21:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07EE25F8D9
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 06:20:59 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r8-20020a1c4408000000b003c47d5fd475so4977397wma.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i4JniJFO6Hdg6kNwzrb/PJxlNwEXD1oSoB9sUXNG4AA=;
        b=KRlIyg/u0tYE5oXblsqDn0dKMd0L7zGHX6PBqE0FCsXsswAwYwco4EFIifQX1ONRW7
         7SaxqLXoSX6mu1Nh7ZFBbvmyXI2zg460zs6nvIAzibw99XZD5uOSyJeIKhOB72YFyDgg
         3T83bJoFOthQsg53QXGuHLHDoMzER0ebn5zLuxpbZDeCHq+H0KPoig72NBZrimtkxYpq
         b5eafxr1uEdcRgvlELg8MnV1TgbO4LZTQEqMQuZttox39NTLfsx8LcDBrDYfCjafaAWe
         Bdv3Yorx+J/XB99YCmhkDaU/qsOy3bnicMiZjV6mqZbIe2KUqJ4/1QLDu3qhTOvNf2fv
         TYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4JniJFO6Hdg6kNwzrb/PJxlNwEXD1oSoB9sUXNG4AA=;
        b=G5wycoEdcaRczoE0qMBlthelKOehgOyXVGFGcbtrLyqsQs6SpVBWw5ZWv5Y8M98IwF
         /+W2khoBwD9slukpCBo2ydqyGd9DXsIMMFYkvKM/VTTFRf9si7oTIoDbRF6ElPMdHRB4
         2dJ7AZAkpyrOgQJ4HoPQFQh0pQ7DydC5NlUlri8nvjQImPcnte/sSuyrIGpe0aIdx8FG
         yqgmrCSIlZthqR3Ino0zbJzE20b0y1eQX15zJA77tBrirvvrtch7g8sDtzEsVy0U5sHw
         QqT+IxL/PX8bz5yPSnxtgm+eLm7mbrhFw/wwKusIADjaxdRbdw7l2okzpe+jD+lZuqwn
         g8pg==
X-Gm-Message-State: ACrzQf0duqY5shUo15/lLgyywtXskDJr7KtNs6IZ5VSemef0tQmo+AxR
        E7K1hfdYf84YKyj9sw5KvtydSg==
X-Google-Smtp-Source: AMsMyM5J4fLco6qzthaoFkH7ErTin58+NxkdGFINMqMFdhJr2i4VdFMQGgMTPWCWXWc+HK19vznoiQ==
X-Received: by 2002:a05:600c:354d:b0:3c8:4b2d:f3fb with SMTP id i13-20020a05600c354d00b003c84b2df3fbmr310079wmq.188.1666358457786;
        Fri, 21 Oct 2022 06:20:57 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id g5-20020a5d4885000000b0022e55f40bc7sm18738768wrq.82.2022.10.21.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:20:57 -0700 (PDT)
Date:   Fri, 21 Oct 2022 15:20:53 +0200
From:   Corentin LABBE <clabbe@baylibre.com>
To:     heiko@sntech.de, ardb@kernel.org, davem@davemloft.net,
        herbert@gondor.apana.org.au, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v10 00/33] crypto: rockchip: permit to pass self-tests
Message-ID: <Y1KctXMZ1+c5uQqd@Red>
References: <20220927075511.3147847-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220927075511.3147847-1-clabbe@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Le Tue, Sep 27, 2022 at 07:54:38AM +0000, Corentin Labbe a �crit :
> Hello
> 
> The rockchip crypto driver is broken and do not pass self-tests.
> This serie's goal is to permit to become usable and pass self-tests.
> 
> This whole serie is tested on a rk3328-rock64, rk3288-miqi and
> rk3399-khadas-edge-v with selftests (with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y)
> 
> Regards
> 

Hello

Gentle ping since it is a month since this serie was sent and no comment was made (except some reviewed-by).
So I think it is ready to be merged, probably thought the crypto tree.

Regards
