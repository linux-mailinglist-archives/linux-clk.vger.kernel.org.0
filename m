Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8027D59CC8C
	for <lists+linux-clk@lfdr.de>; Tue, 23 Aug 2022 01:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238445AbiHVXyr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Aug 2022 19:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiHVXyp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 19:54:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2C251A0E
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 16:54:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD5EC6134B
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 23:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C07C433C1;
        Mon, 22 Aug 2022 23:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661212484;
        bh=Kdq80HUelAZ9VcEZT5bedTFT9bwucjlm6LX0DMt5MuY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=s3Ci4pZoSUzJ9qdLAZCY9thyAuzOfZzKv9Z+xIs74+0dQhDv6Y8k2Yfrbsvozt8lX
         udU0/iwjaeTInWSStgUYZpBSxvoLDFxJMb3xXI8vigSKkWn1HwKcmoornDW1wpZifS
         IPoq/w0LZrCicYUTtrm5QgQQ/JQnpcHVrelTL+r39FDKQUZV/hm1+GjwRsr0F3VAF3
         MsO/J6tf5VbvWIg9w3hsupD0a6P7TZd2AJbc7dTFIC4pz1GLwtEfVLRIX2joklfBU/
         6tQPIjVjga2kdG3ZaHhQ3GLFMrPiaF0J0DFdx1K0OrGqceCQcjmnE7SW4pDLDQQ3g9
         gGG5O1fKkE6Yw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220818113153.14431-1-shubhrajyoti.datta@amd.com>
References: <20220818113153.14431-1-shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH] clk: zynqmp: make bestdiv unsigned
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@amd.com, mturquette@baylibre.com, michal.simek@xilinx.com
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 22 Aug 2022 16:54:42 -0700
User-Agent: alot/0.10
Message-Id: <20220822235444.13C07C433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2022-08-18 04:31:53)
> Divisor is always positive make it u32 *.
> Also the arguments passed are currently of u32 pointers.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Applied to clk-next
