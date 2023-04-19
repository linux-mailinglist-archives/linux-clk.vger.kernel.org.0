Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E1F6E71BB
	for <lists+linux-clk@lfdr.de>; Wed, 19 Apr 2023 05:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjDSDjw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 18 Apr 2023 23:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjDSDjp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 23:39:45 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0783C2B
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 20:39:43 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-63b52ad6311so3228632b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Apr 2023 20:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681875582; x=1684467582;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0e/blrL6Tf9C9Zm88s7yEUaau7+OiJEMt6DtUxmn8U=;
        b=heQMR9KeF4YP7cYFKebZxUoa0zwSm6yermCbrw1yWPuH8qOnanz2PICoK7wFsHoCii
         ITyyopfMMFdHPQ3l53RQJ9R0iCJNIqSOBu8v2kGorc56fgoHdo+lwQn7Rtyot6Fc2TRr
         edENA3S1GqNaFQoyAISXSMcD9w43pa2t9HmnVeof/RNZ8rjOMFaCqEAh77zgB8EAoQ6W
         kv4VzctHo6uh6MWOsPvjXLQbUvLQo6wLB2L4hbWjvmnu6qu8dtL4oR5XBt2/YOm2Avu/
         Hj08KoyiW66V1OPkWan8ZU06NlDH8ZrKHOh5SaFHvZXODbRYM1HW4zSJDCITBvWtjQwK
         dRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681875582; x=1684467582;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0e/blrL6Tf9C9Zm88s7yEUaau7+OiJEMt6DtUxmn8U=;
        b=lwWce7xZAQcnq2LR3T9NBTqy8Kp8l6A2DeDhOi51aXvfQ+hs+Z4uKiF8p8/hgCaYo/
         61J8EpXXEG42a+FBhWOAUUbvXtoiOHni3PlbmyzALK9DFKWo5oerqdk/xvyck5W4prMm
         GZgIAQuJQa8pOHERF+MmpB9z2esm1ab9oy4xCJ+umS457WlU64q2wCR11h1an1STuvIL
         zBkMqqOxVbwDi5puHOIcNaRxDHSUCB8oTJcAmBTLeRo3dIv7GT3BDJ+SL3dJBIdZUwHQ
         4c9POacHW9onrHQKkZ7WwC9aIMoqYWaBPjFR+v4jd+sRb5AfHRIPjI5aBTul/i7u8j4H
         h1DQ==
X-Gm-Message-State: AAQBX9fzIn1aOX8l08DLrAB5e/WbdntrcLo8NQcNy8MNOb8tC4esxm4a
        hMTnnE43iyBh/t0s5U5okSAFbg==
X-Google-Smtp-Source: AKy350bVWhvudAUkLl/P0TT9j1GmLD1pufJBRjFi20EeKXYqEO3qjLGawXTfX3mlLaN9b1oPB/HNmA==
X-Received: by 2002:a05:6a00:2e94:b0:63b:89a2:d62d with SMTP id fd20-20020a056a002e9400b0063b89a2d62dmr2618037pfb.20.1681875582590;
        Tue, 18 Apr 2023 20:39:42 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id n9-20020aa79049000000b0062ddcad2cbesm10270224pfo.145.2023.04.18.20.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 20:39:42 -0700 (PDT)
Date:   Tue, 18 Apr 2023 20:39:42 -0700 (PDT)
X-Google-Original-Date: Tue, 18 Apr 2023 20:39:34 PDT (-0700)
Subject:     Re: [PATCH v1 3/4] soc: sifive: make SiFive's cache controller driver depend on ARCH_ symbols
In-Reply-To: <20230406-subdued-observer-cbb0e2f72cc7@spud>
CC:     linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
        bhelgaas@google.com, Greg KH <gregkh@linuxfoundation.org>,
        jirislaby@kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-serial@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Conor Dooley <conor@kernel.org>
Message-ID: <mhng-8318a24b-b187-4056-ba08-3dfe2054d4fe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 06 Apr 2023 13:57:49 PDT (-0700), Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
> use of such symbols on other architectures, convert the SiFive soc
> drivers to use the new ARCH_FOO symbols.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/soc/sifive/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index e86870be34c9..139884addc41 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -if SOC_SIFIVE || SOC_STARFIVE
> +if ARCH_SIFIVE || ARCH_STARFIVE
>
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
