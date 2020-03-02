Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27031760E2
	for <lists+linux-clk@lfdr.de>; Mon,  2 Mar 2020 18:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727261AbgCBRSY (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 2 Mar 2020 12:18:24 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38532 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbgCBRSX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Mar 2020 12:18:23 -0500
Received: by mail-wr1-f65.google.com with SMTP id t11so723968wrw.5
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2020 09:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=SXg4ANPPHujnOtlOtYMneAF3xY1y0Qzs6lLnP3dZ2Eo=;
        b=mSdaRQNlY7mufhxefFHO9E0HmiRuJqcR5IkePx8zpUI992xFIFgiMiz4Gi5sNj3NEI
         hd9N2W+4Dsx6v7z2hXGn5kxId0G3btlLTgkiwpAyx9BHnkcH7DNgJkFwd9JeQ/SLXftl
         +9HmX3flc+V509SOfMf1CeDGcImsWgpc1FtEXVRF59szYLbOFJ8Ac3vjMAclYY3eVBO0
         VkaksqS/ZaI/Hkm6f1oXy+NUAJUmm7teNAIJtZaVhrPE/dpzQP5pX6HxaqApu+UnpgrR
         m30yCONditdo/eeyfb0vTsI+hldY5qSWaLg8a86atbEOC1iqlmuPytX8k26Sb8Z2TLdZ
         ZtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=SXg4ANPPHujnOtlOtYMneAF3xY1y0Qzs6lLnP3dZ2Eo=;
        b=WxpzhELqkT9yD9GutJFoYkp739maRA9JeyJP2O+m9efSbLCeWBEwREl7TAN/EDn6kY
         6yU98w9E1ZdG3/4HRtwsnKzhrprBHL/J3g6A0AR83agJgOF6pvk3lSiXxZNCt06+mAaY
         Qr3pHaDbhBi+YyOJW7h3lE1pdKBnPLQtT4OrgMwIojtcspiKJWah5LQgXay3DqN+uLFL
         hZ4v2DSlEcAAFBaZcQvJPvHuUvF+bxvxu9Tl3bk8/okeYPmJuhscaPJuFovN5sYGdgB0
         tLPMroGNJAMVQ7PT786jH+nQlkDluykQQ1wPY7o7Fx/c17ravjTDC8Y05PIq82ICfbHJ
         hE0A==
X-Gm-Message-State: ANhLgQ09MMEafibhDKtSuNGZ5wl25Hb6dznZVq2ZXfH3Hxq0zv/ZkN6t
        fXnrAWg9f7tpZqlkR6JxLVUoyQ==
X-Google-Smtp-Source: ADFU+vsX7sylmYulhpint5DODaeUoRGQLESGv6af+LdEy2T3qLGW2WZccdCEKj2zO/+pPKdQyCoHhQ==
X-Received: by 2002:adf:fdc2:: with SMTP id i2mr652127wrs.166.1583169499293;
        Mon, 02 Mar 2020 09:18:19 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c2sm45867wma.39.2020.03.02.09.18.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:18:18 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCHv2 1/2] arm64: dts: meson: Add missing regulator linked to VDDAO_3V3 regulator to FLASH_VDD
In-Reply-To: <20200302125310.742-2-linux.amoon@gmail.com>
References: <20200302125310.742-1-linux.amoon@gmail.com> <20200302125310.742-2-linux.amoon@gmail.com>
Date:   Mon, 02 Mar 2020 18:18:17 +0100
Message-ID: <7hfteqr7za.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Anand Moon <linux.amoon@gmail.com> writes:

> As per schematics add missing VDDAO_3V3 power supply to FLASH_VDD
> regulator.

Could you please add a link to the specific schematics you used to find
this usseu?

> Also add TFLASH_VDD_EN signal name to gpio pin.

Your patch does not do this part.

Similarily to the other patch, can you explain in more detail (including
kernel boot logs) how the SD card is not working?

I just tested with latest mainline, and the MMC driver is detecting both
the eMMC and the SD card.

Kevin
