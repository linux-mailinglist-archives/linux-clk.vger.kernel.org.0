Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84CE059CCA4
	for <lists+linux-clk@lfdr.de>; Tue, 23 Aug 2022 01:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbiHVX7N (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 22 Aug 2022 19:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiHVX7M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 19:59:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54DCCE7
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 16:59:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F52660909
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 23:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31CAC433C1;
        Mon, 22 Aug 2022 23:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661212750;
        bh=cW4kN4y5xFisk77eVYsxuQ6SxJT4lN25fIfw1lv8Mdw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gNEEcLY6qluE7bs7JSFaOnkwtBSLZTF94Pr/51WryrzhZQknpJRKBWmbzz1hQ52Cg
         EiVWowG7/qw0Dl9DXV++mLgAh2nofvuUQqwW5tI2gXQoGvO7XyCAdLeVNZ/HXYZBcl
         m/9uqR1cppuusZPD1FCLk9M5UU3PbvkZk8OW6/TnbQCNp0t6YBZjU6ZMu5RaKefTG2
         18TwOzNqTiwQBtP1x+eznz2VPeqDbb1WY5ioDsQ1HP6BBxMwPIa1ysR8kVCMlmsG+M
         0iiYGw8h7R90N8X1H1uGcYuGg/Tv5eAp5zal3MqB3ZrJzYUF+eR1RzW9S/nFZSbwKV
         2Clg9f9l95Oew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
References: <20220518055314.2486-1-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: Add a check for NULL pointer
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, michal.simek@xilinx.com, git@xilinx.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 22 Aug 2022 16:59:08 -0700
User-Agent: alot/0.10
Message-Id: <20220822235910.A31CAC433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2022-05-17 22:53:14)
> Add a NULL pointer check as clk_hw_get_parent can return NULL.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
