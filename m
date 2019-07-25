Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA92C75172
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jul 2019 16:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbfGYOlT (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 25 Jul 2019 10:41:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42038 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGYOlT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Jul 2019 10:41:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id x1so1160652wrr.9
        for <linux-clk@vger.kernel.org>; Thu, 25 Jul 2019 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=afaFQV2+gmSxhIryTqlJume5dpsRUmNQp36xGyN5C8c=;
        b=Ury/kvRj+NiTLXBSM04pVrmFHM/wLxt6u/rgc/s5fuHi96rbi2u3sokiMds9/2p9vy
         kKNRDRgjlu9jCbJsEO1aD3mvta0FkTmy0YPyqb9rnbwzDSACsGZoWZDIAbwJFo1YBn8P
         YQ9MQXCXdW87VxyXUUk4wWZtXe6nMrXFSjsH+C73aDNT2pEft53bo1xCeON8XAazNq4V
         P58r7dQwNCCrs2/F6/1zD7ggMNcElPZT0wmDS4w19b/Z8H8eO9tEI6y17cwcjl7rf9nI
         COcPtjo0VIxFgwKJyYoHDmEZOMMnWSYcYfXnZAnhiLIpxVEzxBulGfurwIC1vTS2nNJ0
         jjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=afaFQV2+gmSxhIryTqlJume5dpsRUmNQp36xGyN5C8c=;
        b=qhNkUzJu7CIEe1JUW1g3+LqcPASen5rd3C8WlvSSFGSp+qQrw3/QEwcc2IDIvoeXoz
         rR2gQ9vs5wvYnRFPtxmjITxCINyl3Y1w+9CaDdNo8YJm38vbS6xWRiDbeKZPX2+UKJ8e
         3uWpxLNzG3aZTijj1rTYXX+tl8MnZxE2iatr0vypaAs9RYZwvz3vkFc+RZC5XTnMSuu8
         d4He0rRQ5tWqEMLLoUX0QeLNIb3+6g6K/x2ZRqRTNjV8HhDpMRGaEHWQRcEJOq1JfMqV
         5Ltt1XiPQxbh89H60Ejxo8VzGZXfaqt9KD3IHH6bzG/LSXjvdoZym757UBD6aYB75PQI
         RrFg==
X-Gm-Message-State: APjAAAV5nvaJdv+xsXy2SEKj1nnMiN/9qzq/9s6qVexD/BaMviyBzme+
        wb39hliBgoA1xE2lWh5ddypDWw==
X-Google-Smtp-Source: APXvYqy2GHFBySWKMfAzGAvRpQ7QBGKW3FV/iX32ZBFt+sohr5Tc9Rcu6r1RKs+nXquFhZPtzZjVWg==
X-Received: by 2002:adf:afe7:: with SMTP id y39mr92710271wrd.350.1564065677169;
        Thu, 25 Jul 2019 07:41:17 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a2sm50055474wmj.9.2019.07.25.07.41.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 07:41:16 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     khilman@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        baylibre-upstreaming@groups.io,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH 2/4] clk: meson: gxbb-aoclk: migrate to the new parent description method
In-Reply-To: <20190722095053.14104-3-amergnat@baylibre.com>
References: <20190722095053.14104-1-amergnat@baylibre.com> <20190722095053.14104-3-amergnat@baylibre.com>
Date:   Thu, 25 Jul 2019 16:41:15 +0200
Message-ID: <1ja7d2xjlg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 22 Jul 2019 at 11:50, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> @@ -208,8 +216,10 @@ static struct clk_regmap ao_cts_cec = {
>  		 * Until CCF gets fixed, adding this fake parent that won't
>  		 * ever be registered should work around the problem
>  		 */
> -		.parent_names = (const char *[]){ "fixme",
> -						  "ao_cts_rtc_oscin" },
> +		.parent_data = (const struct clk_parent_data []) {
> +			{ .fw_name = "fixme", },

Hum, that would work I suppose but I'd prefer if used .name for this
work around. Remember to throw an '.index = -1' as well

> +			{ .hw = &ao_cts_rtc_oscin.hw },
> +		},
>  		.num_parents = 2,
>  		.flags = CLK_SET_RATE_PARENT,
>  	},
