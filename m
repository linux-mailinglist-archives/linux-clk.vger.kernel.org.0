Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 501716F72EB
	for <lists+linux-clk@lfdr.de>; Thu,  4 May 2023 21:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjEDTGx (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 May 2023 15:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbjEDTGj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 15:06:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D32F9EF6
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 12:05:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E3071636BC
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 19:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF46C433B3;
        Thu,  4 May 2023 19:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683227073;
        bh=785b5ReprMuscQm8vEfSkKNR5HjGXuom4XmEBdU6CPk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EArzFi+nu8kwEB6Aat0S2lMc33gQsCi2968S1EBAQU8aH3BSDUypQ0gOosxUTDLEh
         NRXWKVKzslTbHXvAytER3Ou91fLNJt3+dtG2rQRnYd7RNp2lSpOlRuEOHmERdU7Kgc
         S2p0JQJUZD7KiyAdMtkZWGSdspRCtdWOfN1rTRJIqstz79aS6yf0THRLmKThoFDdKY
         g4QANUdvNDpGzu1yDcA6iN6WKdCyM0ya0Ii6Z+6LZFtyvy+9f3vqnn7SLbBoxJGA72
         F4zx513k0zJW82aWDDGkmqAHDs8hhvt1xAGX2nICnJ9qR5/XnZQNFg3/WnCB0HC0y2
         et20rcxUXDY2w==
Date:   Thu, 4 May 2023 12:04:31 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        <poros@redhat.com>, <mschmidt@redhat.com>,
        <netdev@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v7 3/8] dpll: documentation on DPLL subsystem
 interface
Message-ID: <20230504120431.036cb8ba@kernel.org>
In-Reply-To: <20230428002009.2948020-4-vadfed@meta.com>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-4-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 27 Apr 2023 17:20:04 -0700 Vadim Fedorenko wrote:
> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> 
> Add documentation explaining common netlink interface to configure DPLL
> devices and monitoring events. Common way to implement DPLL device in
> a driver is also covered.
> 
> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

nit: let's put documentation as patch 1, it's more natural for 
a reviewer to start from the docs.

> diff --git a/Documentation/dpll.rst b/Documentation/dpll.rst
> new file mode 100644
> index 000000000000..fba5bc027967
> --- /dev/null
> +++ b/Documentation/dpll.rst
> @@ -0,0 +1,408 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============================
> +The Linux kernel dpll subsystem
> +===============================
> +
> +

nit: two empty lines here...

> +The main purpose of dpll subsystem is to provide general interface
> +to configure devices that use any kind of Digital PLL and could use
> +different sources of signal to synchronize to as well as different
> +types of outputs.
> +The main interface is NETLINK_GENERIC based protocol with an event
> +monitoring multicast group defined.
> +
> +
> +Device object
> +=============

.. but none after the section start? One nl to separate things, please.

> +Single dpll device object means single Digital PLL circuit and bunch of
> +pins connected with it.

s/bunch of pins connected with it/bunch of connected pins/

> +It provides its supported working modes and current status to the user

"reports the supported modes of operation" ?

> +in response to the `do` request of netlink command
> +``DPLL_CMD_DEVICE_GET`` and list of dplls registered in the subsystem
> +with `dump` netlink request of same command.
> +Requesting configuration of dpll device is done with `do` request of

Changing the configuration ?

> +netlink ``DPLL_CMD_DEVICE_SET`` command.
> +
> +
> +Pin object
> +==========
> +A pin is amorphic object which represents either source or output, it

Is the terminology mixing on purpose?
Source or drain vs input or output ?

> +could be internal component of the device, as well as externaly
> +connected.
> +The number of pins per dpll vary, but usually multiple pins shall be
> +provided for a single dpll device.
> +Pin's properties, capabilities and status is provided to the user in
> +response to `do` request of netlink ``DPLL_CMD_PIN_GET`` command.
> +It is also possible to list all the pins that were registered in the
> +system with `dump` request of ``DPLL_CMD_PIN_GET`` command.
> +Configuration of a pin can be changed by `do` request of netlink
> +``DPLL_CMD_PIN_SET`` command.
> +
> +
> +Pin selection
> +=============
> +In general selected pin (the one which signal is driving the dpll
> +device) can be obtained from ``DPLL_A_PIN_STATE`` attribute, and only
> +one pin shall be in ``DPLL_PIN_STATE_CONNECTED`` state for any dpll
> +device.
> +
> +Pin selection can be done either manualy or automatically, depending on

manually, spellcheck?

> +hardware capabilities and active dpll device work mode
> +(``DPLL_A_MODE`` attribute). The consequence is that, there are
> +differences for each mode in terms of available pin states, as well
> +as for the states the user can request for a dpll device.
> +
> +In manual mode (``DPLL_MODE_MANUAL``) the user can request or receive
> +one of following pin states:
> +- ``DPLL_PIN_STATE_CONNECTED`` - the pin is used to drive dpll device
> +- ``DPLL_PIN_STATE_DISCONNECTED`` - the pin is not used to drive dpll
> +  device
> +
> +In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can request or
> +receive one of following pin states:
> +- ``DPLL_PIN_STATE_SELECTABLE`` - the pin shall be considered as valid
> +  source for automatic selection algorithm
> +- ``DPLL_PIN_STATE_DISCONNECTED`` - the pin shall be not considered as
> +  a valid source for automatic selection algorithm
> +In automatic mode (``DPLL_MODE_AUTOMATIC``) the user can only receive
> +pin state ``DPLL_PIN_STATE_CONNECTED`` once automatic selection
> +algorithm locks a dpll device with one of the sources.

But there's a lot more modes in the mode enum :S

> +Shared pins
> +===========
> +A single pin object can be registered to multiple dpll devices.

s/registered/attached/ ?

> +Then there are two groups of configuration knobs:
> +1) Set on a pin - the configuration affects all dpll devices pin is
> +   registered to. (i.e. ``PIN_FREQUENCY``, ``PIN_DIRECTION``),

Why is direction set on a pin? We can't chain DPLLs?

> +2) Set on a pin-dpll tuple - the configuration affects only selected
> +   dpll device. (i.e. PIN_PRIO, PIN_STATE).
> +
> +
> +MUX-type pins
> +=============
> +A pin can be MUX-type, it aggregates child pins and serves as a pin
> +multiplexer. One or more pins are registered with MUX-type instead of
> +being directly registered to a dpll device.
> +Pins registered with a MUX-type provide user with additional nested
> +attribute ``DPLL_A_PIN_PARENT`` for each parent they were registered
> +with.
> +If a pin was registered with multiple parent pins, they behave like a
> +multiple output multiplexer. In this case output of a
> +``DPLL_CMD_PIN_GET`` would contain multiple pin-parent nested
> +attributes with current state related to each parent, like:
> +
> +``'pin': [{
> +        'device': [{'bus-name': 'pci',
> +                    'dev-name': '0000:21:00.0_0', 'id': 0}],
> +        'pin-direction': {'doc': 'pin used as a source of a signal',
> +                          'name': 'source'},
> +        'pin-idx': 13,
> +        'pin-parent': [{'pin-parent-idx': 2,
> +                        'pin-state': {'doc': 'pin disconnected',
> +                                      'name': 'disconnected'}},
> +                       {'pin-parent-idx': 3,
> +                        'pin-state': {'doc': 'pin disconnected',
> +                                      'name': 'disconnected'}}],
> +        }]``
> +
> +Only one child pin can provide it's signal to the parent MUX-type pin at
> +a time, the selection is done with requesting change of child pin state
> +to ``DPLL_PIN_STATE_CONNECTED`` and providing a target MUX-type pin
> +index value in ``DPLL_A_PARENT_PIN_IDX``.
> +
> +Pin priority
> +============
> +Some devices might offer a capability of automatic pin selection mode
> +(enum value ``DPLL_MODE_AUTOMATIC`` of ``DPLL_A_MODE`` attribute).
> +Usually such automatic selection is offloaded to the hardware,

offloaded is a dirty word, s/offloaded to/performed by/

> +which means only pins directly connected to the dpll are capable of
> +automatic source pin selection.

s/are capable of/can be used in the/

> +In automatic selection mode, the user cannot manually select a source
> +pin for the device, instead the user shall provide all directly
> +connected pins with a priority ``DPLL_A_PIN_PRIO``, the device would
> +pick a highest priority valid signal and connect with it.

s/connect with it/use it to control the DPLL device/ ?

> +Child pin of MUX-type is not capable of automatic source pin selection,
> +in order to configure a source of a MUX-type pin, the user needs to
> +request desired pin state of the child pin on the parent - it is done
> +with providing additional attribute for pin set state request - index
> +of parent pin he wish to propagate its signal to
> +(``DPLL_A_PARENT_PIN_IDX``).
> +
> +
> +Configuration commands group
> +============================
> +

oh and the new lines after headers appear ;)

> +Configuration commands are used to get or dump information about

s/or dump//
the netlink ability to query or dump is not something specific to dpll,
I wouldn't mention it so many times.

> +registered dpll devices (and pins), as well as set configuration of
> +device or pins. As dpll device could not be abstract and reflects real

Missing an article before dpll device, maybe "each dpll device", or 'a
dppl device' or 'dpll devices" (plural)

s/could/must/

> +hardware, there is no way to add new dpll device via netlink from user
> +space and each device should be registered by it's driver.
> +
> +All netlink commands require ``GENL_ADMIN_PERM``. This is to prevent
> +any spamming/D.o.S. from unauthorized userspace applications.

no dots in DoS

> +In general it is possible to configure multiple parameters at once.

s/In general//
Should we say that we don't guarantee the change will be atomic in that
case?

> +Device driver implementation
> +============================
> +
> +Device is allocated by ``dpll_device_get`` call. Second call with the
> +same arguments doesn't create new object but provides pointer to
> +previously created device for given arguments, it also increase refcount
> +of that object.
> +Device is deallocated by ``dpll_device_put`` call, which first decreases
> +the refcount, once refcount is cleared the object is destroyed.

You can add () after the function name and render the kdoc at the end
of this doc. The `` marking will then be unnecessary.


