Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307B425F53C
	for <lists+linux-clk@lfdr.de>; Mon,  7 Sep 2020 10:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgIGIas (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 7 Sep 2020 04:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbgIGIaq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Sep 2020 04:30:46 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2A4C061575
        for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2020 01:30:44 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id g4so14842020wrs.5
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2020 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:subject:in-reply-to:date:message-id
         :mime-version;
        bh=nxwjXtCfzhbJphkRoaZPGRX8lSLuG3IRQbDMiVfMlTw=;
        b=hDYe3/X1Fp/nkA8cq5LKQEuabNxEiXDOUvZ6woI5zrDtV/o7pIJt3+dMMm+9HY2TUp
         cJLd1Ak+4UWRcYyvT80mTkYj6NBmFbmk6wB+qnPxWUc1KaSG9Qn2t56LtE+VGh2qiVzv
         9JuYo9Vx8HM3XBkFaq+ij9ZViBAHur8hlIbyrkyKrJ7qClw66Dqhb2jwIu0SC9QJzrdf
         gUGdUHALqoOY+mnDt2IsTPU1QvekYjKaGug1Vdp44Er/RQqCawCgaUylXU1NoaEZKpVP
         zru4e1SdyZCGOVqvjSWFeF95bi3nh2JfDYBl6ExDbqti5ZIjKFPpjuuV0LG1Bi9HubrM
         sD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:subject
         :in-reply-to:date:message-id:mime-version;
        bh=nxwjXtCfzhbJphkRoaZPGRX8lSLuG3IRQbDMiVfMlTw=;
        b=FIDZ7VcipuqMRLxwl0YEd4i76GJWiPmeTnI+c4y8j3P3mbcFCKSr7seUgGvyNdHeaq
         O+desX8E1mvpbQyaXJ1c5keMz+dfDMVnUyy7oUnpcPGwy6pqwMIYqvfmuQwJXwHuaz2q
         c2MpKwD3o4rDS4gtYSVxsLOLG2Gtgik0TiYtbyv80kgm8bn96bsOjUogRJWnieeFfXno
         ZXNqIGQevQGTTx5OhTLCXWaABHgNcoIGjez/jnICd/5HGwzJoIMxyMuaDjAnX3KhPT6o
         f5873IaKGzvD5wGRPlFsBp7+lfh5zFKwxdoQs3DCsghAwOFdjYTAG/OGqqzC88AD9u6/
         /C6Q==
X-Gm-Message-State: AOAM530gw/eoYb1guA/fIeimYMVQsAXz6JnVHaxHF16j3VAKCrF5x0he
        zBGMrYKqxTVgUkruFQH5JquwLg==
X-Google-Smtp-Source: ABdhPJzSdXOEuAZoMyzc+6+YubqhNb8xreJ4au8coroTpf3gvY2rMuV8IzBk2Sy9KwE1J2Tz416CKA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr20049982wrq.408.1599467443488;
        Mon, 07 Sep 2020 01:30:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q18sm27461214wre.78.2020.09.07.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 01:30:42 -0700 (PDT)
References: <20200902150348.14465-1-krzk@kernel.org> <20200902150348.14465-7-krzk@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/10] clk: meson: Simplify with dev_err_probe()
In-reply-to: <20200902150348.14465-7-krzk@kernel.org>
Date:   Mon, 07 Sep 2020 10:30:42 +0200
Message-ID: <1jsgbuaszx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 02 Sep 2020 at 17:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/axg-audio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 53715e36326c..dc22b0c45743 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1509,12 +1509,8 @@ static int devm_clk_get_enable(struct device *dev, char *id)
>  	int ret;
>  
>  	clk = devm_clk_get(dev, id);
> -	if (IS_ERR(clk)) {
> -		ret = PTR_ERR(clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get %s", id);
> -		return ret;
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s", id);
>  
>  	ret = clk_prepare_enable(clk);
>  	if (ret) {

